const SB_URL = 'https://cfcwgmxwksvmlqbxbvyz.supabase.co/rest/v1/dashboard_data';
const SB_KEY = process.env.SB_KEY || '';
const NTFY_TOPIC = process.env.NTFY_TOPIC || 'dashboard-alerts';
const TZ = 'Asia/Hong_Kong';

async function supabaseGet(key) {
  const url = SB_URL + '?key=eq.' + encodeURIComponent(key) + '&select=value';
  const res = await fetch(url, {
    headers: {
      apikey: SB_KEY,
      Authorization: 'Bearer ' + SB_KEY,
      Accept: 'application/json'
    }
  });
  if (!res.ok) return null;
  const data = await res.json();
  if (!data || data.length === 0) return null;
  try { return JSON.parse(data[0].value); } catch { return data[0].value; }
}

function hkHour() {
  const now = new Date();
  const hk = new Intl.DateTimeFormat('en-US', {
    timeZone: TZ, hour: 'numeric', hour12: false
  }).formatToParts(now);
  return parseInt(hk.find(p => p.type === 'hour').value, 10);
}

async function sendNtfy(title, body, priority) {
  const payload = JSON.stringify({
    topic: NTFY_TOPIC,
    title: title,
    message: body,
    priority: priority || 3,
    tags: ['bell']
  });
  const res = await fetch('https://ntfy.sh', {
    method: 'POST',
    body: payload,
    headers: { 'Content-Type': 'application/json' }
  });
  return { status: res.status, ok: res.ok };
}

export default async function handler(req, res) {
  const isTest = req.query.test === '1';
  const isDebug = req.query.debug === '1';

  const currentHour = hkHour();

  if (isDebug) {
    const sleepLog = await supabaseGet('sleep_log');
    const healthLog = await supabaseGet('health_log');
    return res.status(200).json({
      currentHour,
      wakeHour: 7,
      bedHour: 23,
      alarmHour: 22,
      alarmMinute: 30,
      tz: TZ,
      test: isTest,
      debug: isDebug,
      hasSleepLog: !!sleepLog,
      hasHealthLog: !!healthLog
    });
  }

  if (isTest) {
    const result = await sendNtfy('Test Notification', 'Your ntfy.sh setup works', 4);
    return res.status(200).json({ sent: result.ok, ntfyStatus: result.status });
  }

  let sent = false;

  // Wake reminder 7 AM
  if (currentHour === 7) {
    const r = await sendNtfy('Good Morning', 'Time to wake up and start your day', 3);
    sent = r.ok;
  }

  // Bedtime alarm 10:30 PM (hour 22)
  if (currentHour === 22) {
    const r = await sendNtfy('Bedtime Reminder', 'Wind down - bedtime at 11 PM', 4);
    sent = r.ok;
  }

  // Study session reminder at 9 AM, 2 PM, 7 PM — skip weekends after exams done
  if (currentHour === 9 || currentHour === 14 || currentHour === 19) {
    const period = currentHour === 9 ? 'Morning' : currentHour === 14 ? 'Afternoon' : 'Evening';
    const body = period + ' study session! Check your study plan. ' + (currentHour === 19 ? 'Light review, 30 min max.' : '');
    await sendNtfy('📚 ' + period + ' Study Time', body, 3);
    sent = true;
  }

  // Exam day reminders (use current date)
  const todayStr = new Intl.DateTimeFormat('en-CA', { timeZone: TZ }).format(new Date());
  const EXAMS = [
    {date:'2026-06-05', name:'Chinese Reading + Writing'},
    {date:'2026-06-08', name:'English Reading + Writing'},
    {date:'2026-06-09', name:'English Integrated + M1'},
    {date:'2026-06-11', name:'Math P1 + P2'},
    {date:'2026-06-12', name:'Economics'},
    {date:'2026-06-15', name:'Chemistry'},
    {date:'2026-06-22', name:'Biology'}
  ];
  // Night before at 20:00
  if (currentHour === 20) {
    const tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
    const tomorrowStr = new Intl.DateTimeFormat('en-CA', { timeZone: TZ }).format(tomorrow);
    const examTomorrow = EXAMS.find(e => e.date === tomorrowStr);
    if (examTomorrow) {
      await sendNtfy('⚠️ Exam Tomorrow: ' + examTomorrow.name, 'Sleep early and good luck! Exam is at 08:30.', 4);
      sent = true;
    }
  }
  // Morning of exam at 7:00
  if (currentHour === 7) {
    const examToday = EXAMS.find(e => e.date === todayStr);
    if (examToday) {
      await sendNtfy('📅 Exam Day: ' + examToday.name, 'Your exam is today at 08:30! You got this! 💪', 4);
      sent = true;
    }
  }

  // Goal check at 9 AM
  if (currentHour === 9) {
    const today = new Intl.DateTimeFormat('en-CA', { timeZone: TZ }).format(new Date());
    const goals = await supabaseGet('goals:' + today);
    if (goals && goals.length > 0) {
      const incomplete = goals.filter(g => !g.done).length;
      if (incomplete > 0) {
        const r = await sendNtfy('Todays Goals', incomplete + ' goal(s) remaining', 2);
        sent = r.ok;
      }
    }
  }

  res.status(200).send('ok');
}
