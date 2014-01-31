
if (navigator.webkitStartDart) {
  navigator.webkitStartDart();
} else {
  var script = document.createElement('script');
  script.src = 'chrome_apps_dart_mobile.dart.precompiled.js';
  document.body.appendChild(script);
}
