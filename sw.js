const CACHE = 'dash-v1';
const PLAN_KEY = 'study_plan_reminders';

self.addEventListener('install', e => {
  self.skipWaiting();
});

self.addEventListener('activate', e => {
  e.waitUntil(clients.claim());
});

// Listen for timer-triggered notifications from the page
self.addEventListener('message', e => {
  if (e.data && e.data.type === 'schedule-study') {
    const { id, title, body, time } = e.data;
    const now = Date.now();
    const delay = time - now;
    if (delay > 0) {
      setTimeout(() => {
        self.registration.showNotification(title, {
          body: body,
          icon: '/favicon.ico',
          badge: '/favicon.ico',
          tag: id,
          vibrate: [200, 100, 200]
        });
      }, delay);
    }
  }
});

// Handle notification clicks
self.addEventListener('notificationclick', e => {
  e.notification.close();
  e.waitUntil(clients.openWindow('/study.html'));
});
