/**
 * Creates a new window on application launch.
 *
 * @see http://developer.chrome.com/trunk/apps/app.runtime.html
 * @see http://developer.chrome.com/trunk/apps/app.window.html
 */
chrome.app.runtime.onLaunched.addListener(function() {
  chrome.app.window.create('cercasutwitter.html',
    {id: 'cercasutwitter', width: 800, height: 600});
});
