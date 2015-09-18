# API Documentation and Demos for Screencastify API.

### About
The Screencastify API allows users to share recordings with third-party Applications/Sites from
within Screencastify or (optionally) control recording from the site.

#### Sharing from within Screencastify
Apps are shown as an additional upload target in Screencastify's share dialog.

Screencastify can also be configured to "Record for an App". This automatically shares
all new recordings with the configured App. It's the responsibility of the App to handle
and store such recordings.
[Record for App Flow Demo Video](https://www.youtube.com/watch?v=jQMSXJE8O_s)

This is a pure client-side API, recordings are passed to Apps as regular
[File](https://developer.mozilla.org/en/docs/Web/API/File) objects (like from
a file picker) locally.

#### Controlling recording form the site
The recording API allows to initiate and control record from a site. To get an idea how this
works, try the
[In-Site Recorder Demo.](https://w69b.github.io/castify-api-docs/demos/in-site/in-site.html)

The resulting video is shared in the same way as recordings made with the "Record for an App"
feature.

### Getting started
* Configure a new App in the
[API Console](https://www.screencastify.com/user/api_console) to get an AppId. If you only want
to control recording from your App directly and don't want your App to appear as a share option
inside Screencastify, leave the share Url empty.
* Add the API library to your page:
```html
<script src="https://www.screencastify.com/libs-api/castify-api.js"></script>
```
* Set your AppId before using any other library function:
```javascript
screencastify.setAppId(YOUR_APP_ID);
```
* Check if the user has your App connected/added to Screencastify:
```javascript
screencastify.isAppConnected().then(function(isConnected) {
  console.log('App is ' + (isConnected ? 'connected' : 'not connected'));
});
```
* To connect your App, call `screencastify.connectApp();` it returns a Promise
  that resolves on success. This opens a popup window, so only call this in
  event handlers. It takes care of installing Screencastify first, if it is
not installed yet.

* When a user shares a recording with an App, Screencastify opens the share URL
configured for the App in a new tab and passes the shared file ids in a
JSON-encoded `state` query parameter:
```javascript
// Decode the 'state' query parameter yourself or use this helper:
screencastify.decodeStateQuery();
> {ids: ['shared-file-id']}
```
* Retrive shared file from Screencastify:
```javascript
screencastify.getFile('shared-file-id').then(function(fileInfo) {
  // fileInfo = {
  //   duration: 150.4,  // in seconds, undefined if unknown
  //   file: File,
  //   height: 600,  // undefined if unknown
  //   width: 800,  // undefined if unknown
  //   id: 'shared-file-id',
  //   title: 'Test Name'  // file title set by user
  //   payload: 'some string '  // string set with recorder.start()
  // };
});
```
* Process file like any regular file upload.

See demos for working examples.

### Handling shared files in a single tab.
By default Screencastify opens the configured share URL when a file is shared
with an App. In some cases you might want to avoid having a separate tab opened
each time a file is shared with your app, but handle the files in an already
loaded instance of your App instead. This can be achieved by returning true
from the `onSharedFiles` handler. In this case Screencastify will not open a
new tab but focus your Apps' tab that is already loaded instead.
```javascript
screencastify.onSharedFiles = function(fileIds) {
  // fileIds = ['shared-file-id'];
  // Return true (or a Promise that resolves to true) from this handler to
  // indicate that you handle the shared files here.
  return true;
}
```

### Controlling recording
Initiating recording is only available for desktop recording mode (not for cam or tab recording).
```javascript
var recorder = new screencastify.Recorder();
recorder.start({
  recordConfig: {  // optional
    captureSource: 'desktop',  // for window picker, use 'screen' for screen picker
    audio: {
      mic: true,
      system: false
    }
  },
  shareUrl: 'https://your page',  // URL of your page that handles shared files.
  payload: 'optional arbitrary string'  // Can be retrieved in share handler.
}).then(function() {
  // recording has been started
});
```
For more details, please refer to the API reference or in site recorder demo.

## [API Reference](API.md)

## Pricing
This API can be used for free.
For recordings made by users that did not purchase Screencastify, restrictions of Screencastify
Lite apply (max recording length 10 min., branded videos).

### Flat pricing
The restrictions of Screencastify Lite can be removed for a flat fee for all your users. Contact
info@screencastify.com for details.

## Demos:
* [Simple API Demo](https://w69b.github.io/castify-api-docs/demos/simple/simple.html)
* [In-Site Recorder Demo](https://w69b.github.io/castify-api-docs/demos/in-site/in-site.html)
