
chrome.app.runtime.onLaunched.addListener(function(launchData) {
  chrome.app.window.create('chrome_apps_dart_mobile.html', {
    'id': '_mainWindow', 'bounds': {'width': 800, 'height': 600 }
  });
});
