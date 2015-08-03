# castify-api-docs
API Documentation and Demos for Screencastify API.

### About
The Screencastify API allows users to share recordings with third-party Applications.
It is a pure client-side API, recordings are passed to Apps as regular
[File](https://developer.mozilla.org/en/docs/Web/API/File) objects (like a
regular file upload).

### Getting started
* Configure a new App in the
[API Console](https://www.screencastify.com/user/api_console) to get an AppId.
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
  // };
});
```
* Process file like any regular file upload.

See demos for working examples.

### Handling shared files in single tab.
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

## Demos:
* [Simple API Demo](https://w69b.github.io/castify-api-docs/demos/simple/simple.html)
