# ![](screencastify-logo-large.png)Getting started
[About](README.md) / [**Getting started**](getting_started.md) / [API Reference](API.md) / [Demos](demos.md) / [Pricing](pricing.md)
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
* Retrieve shared file from Screencastify:
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

## Handling shared files in a single tab.
_________________________________________
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

## Controlling recording
________________________
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

