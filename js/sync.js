// Unified sync module for all dashboard pages
(function() {
  'use strict';

  var SB_URL = 'https://cfcwgmxwksvmlqbxbvyz.supabase.co/rest/v1/dashboard_data';
  var SB_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNmY3dnbXh3a3N2bWxxYnhidnl6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzkyNjkzODYsImV4cCI6MjA5NDg0NTM4Nn0.4h1RcYroH0CLRCUbZ0GfewQ1R824hbRxUfa_z5n4oXY';
  var PENDING_KEY = '_sync_pending';
  var RETRIES = 3;

  var pending = {};

  function loadPending() {
    try {
      var p = JSON.parse(localStorage.getItem(PENDING_KEY));
      if (p) pending = p;
    } catch(e) {}
  }

  function savePending() {
    try {
      localStorage.setItem(PENDING_KEY, JSON.stringify(pending));
    } catch(e) {}
  }

  function sbHeaders() {
    return {
      'apikey': SB_KEY,
      'Authorization': 'Bearer ' + SB_KEY,
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
  }

  // Sync a key-value pair to Supabase (with retry + queue)
  function syncSet(key, value) {
    try {
      localStorage.setItem(key, JSON.stringify(value));
    } catch(e) {}
    pending[key] = value;
    savePending();
    pushPending();
  }

  // Sync multiple keys at once
  function syncBatch(updates) {
    for (var k in updates) {
      if (updates.hasOwnProperty(k)) {
        try {
          localStorage.setItem(k, JSON.stringify(updates[k]));
        } catch(e) {}
        pending[k] = updates[k];
      }
    }
    savePending();
    pushPending();
  }

  function syncGet(key) {
    try {
      var raw = localStorage.getItem(key);
      if (raw == null) return null;
      var parsed = JSON.parse(raw);
      // Repair double-stringified values from earlier buggy syncPullAll
      if (typeof parsed === 'string') {
        try { return JSON.parse(parsed); } catch(e) { return parsed; }
      }
      return parsed;
    } catch(e) {
      return null;
    }
  }

  function syncRemove(key) {
    try {
      localStorage.removeItem(key);
    } catch(e) {}
    delete pending[key];
    savePending();
  }

  // Push all pending changes to Supabase
  function pushPending() {
    var keys = Object.keys(pending);
    if (!keys.length) return;

    for (var i = 0; i < keys.length; i++) {
      (function(k, attempt) {
        var val = pending[k];
        if (val === undefined) return;
        var body = JSON.stringify({key: k, value: JSON.stringify(val)});
        fetch(SB_URL + '?key=eq.' + encodeURIComponent(k), {
          method: 'PUT',
          headers: sbHeaders(),
          body: body
        }).then(function(r) {
          if (r.status === 404) {
            // Row doesn't exist yet — insert
            return fetch(SB_URL, {
              method: 'POST',
              headers: sbHeaders(),
              body: body
            });
          }
          return r;
        }).then(function(r) {
          if (r && r.ok) {
            delete pending[k];
            savePending();
          } else if (attempt < RETRIES) {
            setTimeout(function() { pushPending(); }, 1000 * (attempt + 1));
          }
        }).catch(function() {
          if (attempt < RETRIES) {
            setTimeout(function() { pushPending(); }, 1000 * (attempt + 1));
          }
        });
      })(keys[i], 0);
    }
  }

  // Pull a single key from Supabase (returns promise)
  function syncPull(key) {
    return fetch(SB_URL + '?key=eq.' + encodeURIComponent(key) + '&select=value', {
      headers: sbHeaders()
    }).then(function(r) {
      if (!r.ok) return null;
      return r.json();
    }).then(function(data) {
      if (!data || data.length === 0) return null;
      try {
        return JSON.parse(data[0].value);
      } catch(e) {
        return data[0].value;
      }
    });
  }

  // Pull all keys matching a prefix from Supabase
  function syncPullPrefix(prefix) {
    return fetch(SB_URL + '?key=like.' + encodeURIComponent(prefix + '*') + '&select=key,value', {
      headers: sbHeaders()
    }).then(function(r) {
      if (!r.ok) return [];
      return r.json();
    }).then(function(rows) {
      var result = {};
      for (var i = 0; i < rows.length; i++) {
        var v = rows[i].value;
        if (typeof v === 'string') {
          try { result[rows[i].key] = JSON.parse(v); } catch(e) { result[rows[i].key] = v; }
        } else {
          result[rows[i].key] = v;
        }
      }
      return result;
    });
  }

  // Pull ALL keys from Supabase and write to localStorage
  function syncPullAll() {
    return fetch(SB_URL + '?select=key,value', {
      headers: sbHeaders()
    }).then(function(r) {
      if (!r.ok) return [];
      return r.json();
    }).then(function(rows) {
      for (var i = 0; i < rows.length; i++) {
        var v = rows[i].value;
        try {
          if (typeof v === 'string') {
            localStorage.setItem(rows[i].key, v); // already a JSON string from Supabase TEXT col
          } else {
            localStorage.setItem(rows[i].key, JSON.stringify(v)); // parsed object from JSONB col
          }
        } catch(e) {}
      }
      return rows;
    }).catch(function() { return []; });
  }

  // Initialize: load pending, push on pagehide, pull remote data
  function syncInit() {
    loadPending();
    pushPending();
    var p = syncPullAll(); // writes remote data to localStorage
    window.addEventListener('pagehide', function() {
      pushPending();
    });
    window.addEventListener('beforeunload', function() {
      pushPending();
    });
    document.addEventListener('visibilitychange', function() {
      if (document.hidden) pushPending();
    });
    return p; // return promise so callers can await before reading data
  }

  // Expose globally
  window.syncSet = syncSet;
  window.syncGet = syncGet;
  window.syncRemove = syncRemove;
  window.syncBatch = syncBatch;
  window.syncPull = syncPull;
  window.syncPullPrefix = syncPullPrefix;
  window.syncPullAll = syncPullAll;
  window.syncInit = syncInit;

})();
