$path = "C:\Users\bdbsh\OneDrive\桌面\Learn\dashboard\fitness.html"

$part1 = @'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>Fitness & Recovery</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="icon" type="image/svg+xml" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>💪</text></svg>">
<style>
:root{--bg:#000;--sbg:#111;--c1:#F97316;--c2:#3B82F6;--c3:#8B5CF6;--g:#22C55E;--y:#F59E0B;--r:#EF4444;--t1:#fff;--t2:#aaa;--br:12px;--sh:0 4px 24px rgba(0,0,0,.5)}
body{margin:0;padding:20px 14px 90px;background:var(--bg);color:var(--t1);font-family:'Space Grotesk',sans-serif;min-height:100vh;position:relative}
body::before{content:'';position:fixed;top:-30%;left:50%;transform:translateX(-50%);width:600px;height:600px;background:radial-gradient(circle,rgba(249,115,22,.08) 0%,transparent 70%);pointer-events:none;z-index:0}
.po-shell{max-width:430px;margin:0 auto;position:relative;z-index:1}
*{box-sizing:border-box;-webkit-tap-highlight-color:transparent}
::-webkit-scrollbar{width:4px}::-webkit-scrollbar-track{background:transparent}::-webkit-scrollbar-thumb{background:#333;border-radius:4px}
::selection{background:rgba(249,115,22,.3)}a{color:var(--c1);text-decoration:none}
@keyframes fadeIn{from{opacity:0;transform:translateY(10px)}to{opacity:1;transform:translateY(0)}}
@keyframes pulse{0%,100%{opacity:1}50%{opacity:.5}}
@keyframes slideUp{from{opacity:0;transform:translateY(20px)}to{opacity:1;transform:translateY(0)}}
@keyframes spin{to{transform:rotate(360deg)}}
@keyframes pop{0%{transform:scale(.8);opacity:0}50%{transform:scale(1.05)}100%{transform:scale(1);opacity:1}}

.fl{display:flex}.fc{flex-direction:column}.fw{flex-wrap:wrap}.f1{flex:1}.g4{gap:4px}.g8{gap:8px}.g12{gap:12px}.ac{cursor:pointer}.tac{text-align:center}.w100{width:100%}.mt8{margin-top:8px}.mt12{margin-top:12px}.mt16{margin-top:16px}.mb8{margin-bottom:8px}.mb12{margin-bottom:12px}.mb16{margin-bottom:16px}.p12{padding:12px}.pr{position:relative}
.btn{padding:10px 20px;border:none;border-radius:var(--br);cursor:pointer;font-family:inherit;font-size:14px;font-weight:600;transition:all .2s;display:inline-flex;align-items:center;gap:6px}.btn-p{background:linear-gradient(135deg,var(--c1),var(--c2));color:#fff}.btn-p:hover{opacity:.9;transform:translateY(-1px)}.btn-s{background:var(--sbg);color:var(--t1);border:1px solid #333}.btn-s:hover{background:#1a1a1a}.btn-g{background:var(--g);color:#fff}.btn-r{background:var(--r);color:#fff}.btn-sm{padding:6px 12px;font-size:12px}.btn:disabled{opacity:.5;cursor:not-allowed}.btn-icon{width:36px;height:36px;padding:0;justify-content:center;border-radius:50%}
.tag{display:inline-flex;padding:3px 10px;border-radius:20px;font-size:11px;font-weight:600}.tag-g{background:rgba(34,197,94,.15);color:var(--g)}.tag-y{background:rgba(245,158,11,.15);color:var(--y)}.tag-r{background:rgba(239,68,68,.15);color:var(--r)}.tag-b{background:rgba(59,130,246,.15);color:var(--c2)}.tag-o{background:rgba(249,115,22,.15);color:var(--c1)}
.modal-bg{display:none;position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,.7);backdrop-filter:blur(4px);z-index:1000;justify-content:center;align-items:center;animation:fadeIn .2s ease}
.modal-bg.a{display:flex}
.modal{background:var(--sbg);border:1px solid #222;border-radius:var(--br);padding:24px;max-width:400px;width:90%;max-height:85vh;overflow-y:auto;animation:slideUp .25s ease}
.modal h3{margin:0 0 16px;font-size:18px;background:linear-gradient(135deg,var(--c1),var(--c2));-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text}
.modal label{display:block;font-size:13px;color:var(--t2);margin-bottom:4px;margin-top:12px}
.modal input,.modal select,.modal textarea{width:100%;padding:10px 12px;background:#1a1a1a;border:1px solid #333;border-radius:8px;color:var(--t1);font-family:inherit;font-size:14px;outline:none;transition:border .2s}
.modal input:focus,.modal select:focus,.modal textarea:focus{border-color:var(--c1)}.modal textarea{resize:vertical;min-height:60px}
.modal .btn{margin-top:16px;width:100%;justify-content:center}
.modal-close{position:absolute;top:12px;right:12px;background:none;border:none;color:var(--t2);font-size:20px;cursor:pointer;width:32px;height:32px;border-radius:50%;display:flex;align-items:center;justify-content:center;transition:all .2s}
.modal-close:hover{background:#222;color:var(--t1)}
.modal-actions{display:flex;gap:8px;margin-top:16px}
.modal-actions .btn{flex:1}
.form-row{display:flex;gap:8px;align-items:flex-end}
.form-row>*{flex:1}
.ml8{margin-left:8px}.mr8{margin-right:8px}
.hidden{display:none!important}

.title-large{font-size:28px;font-weight:700;margin:0 0 4px;text-align:center;background:linear-gradient(135deg,var(--c1),var(--c2));-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text}
.title-sub{font-size:13px;color:var(--t2);text-align:center;margin:0 0 20px}

/* sub-tabs */
.fpills{display:flex;gap:6px;margin-bottom:20px;background:var(--sbg);border-radius:var(--br);padding:4px;border:1px solid #222}
.fpill{flex:1;text-align:center;padding:8px 12px;border-radius:8px;font-size:12px;font-weight:600;color:var(--t2);cursor:pointer;transition:all .2s;background:transparent;border:none;font-family:inherit}
.fpill:hover{color:var(--t1)}
.fpill.a{background:linear-gradient(135deg,var(--c1),var(--c2));color:#fff;box-shadow:0 2px 12px rgba(249,115,22,.3)}
.fsec{display:none;animation:fadeIn .3s ease}
.fsec.a{display:block}

/* tab bar */
.tab-bar{position:fixed;bottom:0;left:0;width:100%;background:rgba(0,0,0,.95);backdrop-filter:blur(12px);border-top:1px solid #222;display:flex;z-index:999;padding:4px 0 env(safe-area-inset-bottom,4px)}
.tab-item{flex:1;display:flex;flex-direction:column;align-items:center;gap:2px;padding:6px 0;cursor:pointer;color:var(--t2);font-size:10px;font-weight:500;transition:all .2s;border:none;background:none;font-family:inherit;text-decoration:none}
.tab-item svg{width:22px;height:22px;transition:all .2s}
.tab-item:hover{color:var(--t1)}.tab-item.a{color:var(--c1)}.tab-item.a svg{filter:drop-shadow(0 0 6px rgba(249,115,22,.3))}

/* gym section */
.po-header{display:flex;align-items:center;justify-content:space-between;margin-bottom:16px}
.po-header h2{font-size:18px;margin:0;background:linear-gradient(135deg,var(--c1),var(--c2));-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text}
.po-header-actions{display:flex;gap:8px}
.po-header-actions .btn-icon{width:32px;height:32px;font-size:14px}
.po-date-nav{display:flex;align-items:center;justify-content:space-between;background:var(--sbg);border:1px solid #222;border-radius:var(--br);padding:10px 14px;margin-bottom:12px}
.po-date-nav .date{font-size:14px;font-weight:600}.po-date-nav .nav-btn{background:none;border:none;color:var(--t2);font-size:18px;cursor:pointer;width:32px;height:32px;border-radius:50%;display:flex;align-items:center;justify-content:center;transition:all .2s}
.po-date-nav .nav-btn:hover{background:#222;color:var(--t1)}
.po-stats{display:grid;grid-template-columns:1fr 1fr;gap:8px;margin-bottom:12px}
.po-stat{background:var(--sbg);border:1px solid #222;border-radius:var(--br);padding:12px}
.po-stat .l{font-size:11px;color:var(--t2)}.po-stat .v{font-size:20px;font-weight:700;margin-top:4px}
.po-stat .v.g{color:var(--g)}.po-stat .v.o{color:var(--c1)}.po-stat .v.b{color:var(--c2)}.po-stat .v.r{color:var(--r)}
.po-card{background:var(--sbg);border:1px solid #222;border-radius:var(--br);padding:14px;margin-bottom:10px}
.po-card-h{display:flex;justify-content:space-between;align-items:center;margin-bottom:8px}
.po-card-h h3{font-size:14px;margin:0}.po-card .more{font-size:12px;color:var(--t2);cursor:pointer}
.po-ex-item{display:flex;align-items:center;gap:10px;padding:10px 0;border-bottom:1px solid #1a1a1a}
.po-ex-item:last-child{border-bottom:none}
.po-ex-item .name{flex:1;font-size:13px;font-weight:500}
.po-ex-item .detail{font-size:11px;color:var(--t2)}
.po-ex-item .sets{font-size:13px;font-weight:600;color:var(--c1)}
.po-ex-item .check{width:20px;height:20px;border:2px solid #333;border-radius:50%;display:flex;align-items:center;justify-content:center;cursor:pointer;transition:all .2s;flex-shrink:0}
.po-ex-item .check.done{background:var(--g);border-color:var(--g)}
.po-ex-item .check.done::after{content:'✓';color:#fff;font-size:12px;font-weight:700}
.po-ex-toggle{cursor:pointer;user-select:none}
.po-ex-toggle:hover{opacity:.8}
.po-ex-children{padding-left:24px}
.po-ex-child{display:flex;align-items:center;gap:8px;padding:6px 0;font-size:13px}
.po-ex-child .check{width:18px;height:18px;border:2px solid #333;border-radius:4px;cursor:pointer;display:flex;align-items:center;justify-content:center;flex-shrink:0;transition:all .2s}
.po-ex-child .check.done{background:var(--g);border-color:var(--g)}
.po-ex-child .check.done::after{content:'✓';color:#fff;font-size:10px;font-weight:700}
.po-ex-child .name{flex:1}
.po-ex-child .wt{color:var(--t2);font-size:12px}
.po-bar{height:4px;background:#1a1a1a;border-radius:2px;overflow:hidden;margin-top:6px}
.po-bar-fill{height:100%;border-radius:2px;transition:width .5s ease}
.po-filter{display:flex;gap:6px;overflow-x:auto;padding-bottom:6px;margin-bottom:10px}
.po-filter::-webkit-scrollbar{height:2px}
.po-filter .f{white-space:nowrap;padding:5px 12px;border-radius:20px;font-size:12px;font-weight:500;cursor:pointer;transition:all .2s;background:var(--sbg);border:1px solid #222;color:var(--t2);font-family:inherit}
.po-filter .f.a{background:linear-gradient(135deg,var(--c1),var(--c2));color:#fff;border-color:transparent}
.po-ex-row{display:flex;align-items:center;gap:8px;padding:8px 0;border-bottom:1px solid #1a1a1a}
.po-ex-row:last-child{border-bottom:none}
.po-ex-row .info{flex:1}.po-ex-row .info .name{font-size:13px;font-weight:500}
.po-ex-row .info .sub{font-size:11px;color:var(--t2)}
.po-mr{margin-right:4px}.po-ml{margin-left:4px}
.po-wt-item{display:flex;align-items:center;gap:10px;padding:8px 0;border-bottom:1px solid #1a1a1a}
.po-wt-item:last-child{border-bottom:none}
.po-wt-item .v{font-weight:700;font-size:15px;color:var(--c1);min-width:50px}
.po-wt-item .d{font-size:12px;color:var(--t2)}
.po-wt-item .ch{font-size:12px;margin-left:auto}
.po-wt-item .ch.up{color:var(--g)}.po-wt-item .ch.down{color:var(--r)}.po-wt-item .ch.same{color:var(--t2)}
.po-sparkline{height:50px;margin:8px 0}
.po-empty{text-align:center;padding:30px 20px;color:var(--t2);font-size:14px}
.po-empty svg{width:48px;height:48px;margin-bottom:12px;opacity:.3}
@media(max-width:400px){.po-stats{grid-template-columns:1fr 1fr}.po-stat{padding:10px}.po-stat .v{font-size:17px}}

/* water section */
.wtr-header{display:flex;align-items:center;justify-content:space-between;margin-bottom:16px}
.wtr-header h2{font-size:18px;margin:0;background:linear-gradient(135deg,var(--c1),var(--c2));-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text}
.wtr-card{background:var(--sbg);border:1px solid #222;border-radius:var(--br);padding:20px;margin-bottom:12px}
.wtr-card-h{display:flex;justify-content:space-between;align-items:center;margin-bottom:8px}
.wtr-card-h h3{font-size:14px;margin:0}.wtr-card .more{font-size:12px;color:var(--t2);cursor:pointer}
.wtr-progress{height:40px;background:#1a1a1a;border-radius:20px;overflow:hidden;position:relative;margin:12px 0}
.wtr-progress-fill{height:100%;border-radius:20px;transition:width .5s ease;background:linear-gradient(90deg,var(--c2),var(--c3))}
.wtr-progress-txt{position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);font-size:12px;font-weight:600}
.wtr-amt{font-size:36px;font-weight:700;text-align:center;margin:8px 0;background:linear-gradient(135deg,var(--c2),var(--c3));-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text}
.wtr-label{font-size:12px;color:var(--t2);text-align:center;margin-bottom:12px}
.wtr-actions{display:flex;gap:8px;flex-wrap:wrap;justify-content:center;margin:12px 0}
.wtr-actions .btn{flex:1;min-width:60px;max-width:100px;justify-content:center;padding:12px 8px;border-radius:var(--br);font-size:13px}
.wtr-actions .btn-add{background:linear-gradient(135deg,var(--c2),var(--c3));color:#fff;border:none;cursor:pointer;font-family:inherit;font-weight:600;transition:all .2s}
.wtr-actions .btn-add:hover{opacity:.9;transform:translateY(-1px)}
.wtr-actions .btn-sub{background:var(--sbg);color:var(--t1);border:1px solid #333;cursor:pointer;font-family:inherit;font-weight:600;transition:all .2s}
.wtr-actions .btn-sub:hover{background:#1a1a1a}
.wtr-day-pill{display:flex;gap:6px;margin-bottom:16px;background:var(--sbg);border-radius:var(--br);padding:4px;border:1px solid #222}
.wtr-day-pill .p{flex:1;text-align:center;padding:6px 4px;border-radius:6px;font-size:11px;font-weight:600;cursor:pointer;transition:all .2s;color:var(--t2);background:none;border:none;font-family:inherit}
.wtr-day-pill .p.a{background:linear-gradient(135deg,var(--c2),var(--c3));color:#fff;box-shadow:0 2px 12px rgba(59,130,246,.3)}
.wtr-why{padding:12px 16px;background:rgba(59,130,246,.08);border-left:3px solid var(--c2);border-radius:0 var(--br) var(--br) 0;margin-bottom:12px;font-size:13px;line-height:1.5;color:var(--t2)}
.wtr-why strong{color:var(--t1)}
.wtr-history{max-height:200px;overflow-y:auto}
.wtr-h-item{display:flex;justify-content:space-between;align-items:center;padding:8px 0;border-bottom:1px solid #1a1a1a;font-size:13px}
.wtr-h-item:last-child{border-bottom:none}
.wtr-h-item .d{color:var(--t2)}.wtr-h-item .v{font-weight:600}
.wtr-sparkline{height:40px;margin:8px 0}
.wtr-custom-input{display:flex;gap:8px;align-items:center;justify-content:center;margin-top:8px}
.wtr-custom-input input{width:80px;padding:8px 10px;background:#1a1a1a;border:1px solid #333;border-radius:8px;color:var(--t1);font-family:inherit;font-size:14px;text-align:center;outline:none}
.wtr-custom-input input:focus{border-color:var(--c2)}
.wtr-custom-input .btn{padding:8px 16px;font-size:13px}
.wtr-celebrate{position:fixed;top:50%;left:50%;transform:translate(-50%,-50%) scale(0);font-size:64px;z-index:1001;pointer-events:none;transition:transform .3s cubic-bezier(.34,1.56,.64,1)}
.wtr-celebrate.a{transform:translate(-50%,-50%) scale(1)}

/* sleep section */
.st-header{display:flex;align-items:center;justify-content:space-between;margin-bottom:16px}
.st-header h2{font-size:18px;margin:0;background:linear-gradient(135deg,var(--c1),var(--c2));-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text}
.st-card{background:var(--sbg);border:1px solid #222;border-radius:var(--br);padding:14px;margin-bottom:10px}
.st-card-h{display:flex;justify-content:space-between;align-items:center;margin-bottom:8px}
.st-card-h h3{font-size:14px;margin:0}.st-card .more{font-size:12px;color:var(--t2);cursor:pointer}
.st-input-row{display:flex;gap:8px;flex-wrap:wrap}
.st-input-row input{flex:1;min-width:100px;padding:10px 12px;background:#1a1a1a;border:1px solid #333;border-radius:8px;color:var(--t1);font-family:inherit;font-size:14px;outline:none}
.st-input-row input:focus{border-color:var(--c3)}
.st-input-row input[type=time]{min-width:90px}
.st-input-row .btn{padding:10px 20px}
.st-stats{display:grid;grid-template-columns:1fr 1fr 1fr;gap:8px;margin-bottom:12px}
.st-stat{background:var(--sbg);border:1px solid #222;border-radius:var(--br);padding:10px;text-align:center}
.st-stat .l{font-size:10px;color:var(--t2);text-transform:uppercase;letter-spacing:.5px}
.st-stat .v{font-size:16px;font-weight:700;margin-top:4px}
.st-stat .v.g{color:var(--g)}.st-stat .v.o{color:var(--c1)}.st-stat .v.b{color:var(--c2)}
.st-week{display:grid;grid-template-columns:repeat(7,1fr);gap:4px;margin:8px 0}
.st-day{aspect-ratio:1;border-radius:8px;display:flex;flex-direction:column;align-items:center;justify-content:center;font-size:9px;font-weight:600;background:#1a1a1a;border:1px solid #222;transition:all .2s}
.st-day .dow{color:var(--t2);margin-bottom:2px}
.st-day .dot{width:6px;height:6px;border-radius:50%;margin-top:2px}
.st-day.has{border-color:var(--c3)}.st-day.g{border-color:var(--g)}.st-day.o{border-color:var(--c1)}.st-day.r{border-color:var(--r)}
.st-history{max-height:200px;overflow-y:auto}
.st-h-item{display:flex;justify-content:space-between;align-items:center;padding:8px 0;border-bottom:1px solid #1a1a1a;font-size:13px}
.st-h-item:last-child{border-bottom:none}
.st-h-item .d{color:var(--t2)}.st-h-item .v{font-weight:600}
.st-h-item .tag{font-size:10px}
.st-duration{font-size:24px;font-weight:700;text-align:center;margin:8px 0;background:linear-gradient(135deg,var(--c3),var(--c2));-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text}
.st-label{font-size:12px;color:var(--t2);text-align:center;margin-bottom:8px}
</style>
<script src="js/sync.js"></script>
</head>
<body>
<div class="po-shell">
<div class="title-large">Fitness & Recovery</div>
<div class="title-sub">Track your gym, water &amp; sleep</div>
<div class="fpills">
<button class="fpill a" onclick="switchTab('gym')">🏋️ Gym</button>
<button class="fpill" onclick="switchTab('water')">💧 Water</button>
<button class="fpill" onclick="switchTab('sleep')">😴 Sleep</button>
</div>

<div id="fitness-gym" class="fsec a">
'@

Set-Content -Path $path -Value $part1 -Encoding UTF8
Write-Host "Part 1 written. Size: $((Get-Item $path).Length) bytes"
