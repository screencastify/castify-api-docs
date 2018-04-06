# API Reference
<a name="screencastify"></a>

[screencastify](#screencastify)
  * _static_
      * [.isAppConnected](#screencastify.isAppConnected) ⇒ <code>Promise</code>
      * [.setUserExpiryDate](#screencastify.setUserExpiryDate) ⇒ <code>Promise</code>
      * [.setUserShareUrl](#screencastify.setUserShareUrl) ⇒ <code>Promise</code>
      * [.storeFileInLibrary](#screencastify.storeFileInLibrary) ⇒ <code>Promise</code>
      * [.getFile](#screencastify.getFile) ⇒ <code>Promise</code>
      * [.connectApp](#screencastify.connectApp) ⇒ <code>Promise</code>
      * [.isInstalled](#screencastify.isInstalled) ⇒ <code>Promise</code>
      * [.Recorder()](#screencastify.Recorder)
          * [.state](#screencastify.Recorder+state) : <code>String</code>
          * [.time](#screencastify.Recorder+time) : <code>number</code>
          * [.onStateChanged](#screencastify.Recorder+onStateChanged) : <code>function</code>
          * [.onTimeChanged](#screencastify.Recorder+onTimeChanged) : <code>function</code>
          * [.start](#screencastify.Recorder+start) ⇒ <code>Promise</code>
          * [.stop](#screencastify.Recorder+stop) ⇒ <code>Promise</code>
          * [.pause](#screencastify.Recorder+pause) ⇒ <code>Promise</code>
          * [.resume](#screencastify.Recorder+resume) ⇒ <code>Promise</code>
      * [.isBrowserSupported()](#screencastify.isBrowserSupported) ⇒ <code>boolean</code>
      * [.decodeStateQuery([search])](#screencastify.decodeStateQuery) ⇒ <code>Object</code>
      * [.setAppId(id)](#screencastify.setAppId)
  * _inner_
      * [~AudioConfig](#screencastify..AudioConfig) : <code>Object</code>
      * [~SizeConfig](#screencastify..SizeConfig) : <code>Object</code>
      * [~RecordConfig](#screencastify..RecordConfig) : <code>Object</code>
      * [~StartConfig](#screencastify..StartConfig) : <code>Object</code>
<a name="screencastify.isAppConnected"></a>
## screencastify.isAppConnected ⇒ <code>Promise</code>
___

Check if App is connected. Returns false if platform is unsupported or extension not
installed.

**Returns**: <code>Promise</code> - that resolves with boolean result.  
<a name="screencastify.setUserExpiryDate"></a>
## screencastify.setUserExpiryDate ⇒ <code>Promise</code>
___

Set expiry date for user of paid App.
If you set the expiry date to zero (or null), the paid version will never expire for the
current user. This is the default value for all users.
For any other number, the user will fall back to the trial version after the expiry date.
Calling this function for a free app always fails.

**Returns**: <code>Promise</code> - resolves when done.  
**Params**

- date <code>Number</code> - date in ms since 1 January 1970 00:00:00 UTC or null.
<a name="screencastify.setUserShareUrl"></a>

## screencastify.setUserShareUrl ⇒ <code>Promise</code>
___
Set default shareUrl for the current user. If set, the provided url overrides the shareUrl
configured in the API console for the current user.
Setting the url to null reverts the default shareUrl to the value configured in the API
console.

**Returns**: <code>Promise</code> - resolves when done.  
**Params**

- url <code>String</code> - shareUrl for current user or null.
<a name="screencastify.storeFileInLibrary"></a>

## screencastify.storeFileInLibrary ⇒ <code>Promise</code>
___
Store given file in Screencastify user library.
By default recordings initiated via the API, or automatically shared recordings are not
shown in the users "Your Recordings" library.
Call this function to store such a recording there.

**Returns**: <code>Promise</code> - resolves when done.  
**Params**

- fileId <code>String</code> - file id.
- [openFile] <code>boolean</code> - open file in Screencastify when done.
<a name="screencastify.getFile"></a>

## screencastify.getFile ⇒ <code>Promise</code>
___
Get metadata of given file id.

**Returns**: <code>Promise</code> - resolves with object.  
**Params**

- fileId <code>String</code> - file id.

**Example**  
```js
screencastify.getFile('shared-file-id').then(function(fileInfo) {
 fileInfo = {
  duration: 150.4,  // in seconds, undefined if unknown
  file: File,
  height: 600,  // undefined if unknown
  width: 800,  // undefined if unknown
  id: 'shared-file-id',
  title: 'Test Name',  // file title set by user
  payload: 'some string',  // string set with recorder.start()
  inLibrary: false  // whether file is stored in user library
});
```
<a name="screencastify.connectApp"></a>

## screencastify.connectApp ⇒ <code>Promise</code>
___
Connect your App to Screencastify.
This opens a popup window, so only call this in event handlers.
It takes care of installing Screencastify first, if it is not installed yet.

**Returns**: <code>Promise</code> - it returns a Promise that resolves on success or rejects on error.  
<a name="screencastify.isInstalled"></a>

## screencastify.isInstalled ⇒ <code>Promise</code>
___
Check if extension is installed.

**Returns**: <code>Promise</code> - that resolves with a version string if installed, false else.  

<a name="screencastify.Recorder"></a>

## screencastify.Recorder()
___
Recorder controller.


* [.Recorder()](#screencastify.Recorder)
    * [.state](#screencastify.Recorder+state) : <code>String</code>
    * [.time](#screencastify.Recorder+time) : <code>number</code>
    * [.onStateChanged](#screencastify.Recorder+onStateChanged) : <code>function</code>
    * [.onTimeChanged](#screencastify.Recorder+onTimeChanged) : <code>function</code>
    * [.start](#screencastify.Recorder+start) ⇒ <code>Promise</code>
    * [.stop](#screencastify.Recorder+stop) ⇒ <code>Promise</code>
    * [.pause](#screencastify.Recorder+pause) ⇒ <code>Promise</code>
    * [.resume](#screencastify.Recorder+resume) ⇒ <code>Promise</code>

<a name="screencastify.Recorder+state"></a>

### recorder.state : <code>String</code>
Current recorder state. String out of ['inactive', 'recording', 'paused'].

<a name="screencastify.Recorder+time"></a>

### recorder.time : <code>number</code>
Current recorder time in seconds.

<a name="screencastify.Recorder+onStateChanged"></a>

### recorder.onStateChanged : <code>function</code>
Set this property to a function to get notified when the recorder state changed.
It's called with the new state as the only argument.

**Example**  
```js
recorder.onStateChanged = function(state) {
   console.log('state changed to', state);
 }
```
<a name="screencastify.Recorder+onTimeChanged"></a>

### recorder.onTimeChanged : <code>function</code>
Set this property to a function to get notified when the recorder time changed.
It's called with the new time as the only argument.

**Example**  
```js
recorder.onTimeChanged = function(time) {
   console.log('time changed to', time);
 }
```
<a name="screencastify.Recorder+start"></a>

### recorder.start ⇒ <code>Promise</code>
Start recording.

**Returns**: <code>Promise</code> - resolves when recording has been started / rejects on errors.  
**Params**

- config <code>StartConfig</code> - recording configuration.

**Example**  
```js
var recorder = new screencastify.Recorder();
recorder.start({
    shareUrl: location.href,  // handle shared file on same page
    payload: 'some string',
    recordConfig: {
      audio: {mic: true}
    }
  }).then(function() {
  console.log('recording started');
});
```
**Example**  
```js
var recorder = new screencastify.Recorder();
recorder.start({
    shareUrl: location.href,  // handle shared file on same page
    // Record the entire screen
    captureSource: 'screen',
    recordConfig: {
      // 3 seconds countdown
      startDelay: 3,
      // Limit frame rate to 15 fps
      maxFps: 15,
      // screen resolution will be scaled down to fit in a box of this size
      maxResolution: {width: 640, height: 480},
      audio: {mic: true}
    }
  }).then(function() {
  console.log('recording started');
});
```
<a name="screencastify.Recorder+stop"></a>

### recorder.stop ⇒ <code>Promise</code>
Stop recording.

**Returns**: <code>Promise</code> - resolves when recording has been stopped / rejects on errors.  
<a name="screencastify.Recorder+pause"></a>

### recorder.pause ⇒ <code>Promise</code>
Pause recording.

**Returns**: <code>Promise</code> - resolves when recording has been paused / rejects on errors.  
<a name="screencastify.Recorder+resume"></a>

### recorder.resume ⇒ <code>Promise</code>
Resume recording after it has been paused.

**Returns**: <code>Promise</code> - resolves when recording has been resumed / rejects on errors.  
<a name="screencastify.isBrowserSupported"></a>

## screencastify.isBrowserSupported() ⇒ <code>boolean</code>
___
Check if browser is supported.

**Returns**: <code>boolean</code> - true if supported.  
<a name="screencastify.decodeStateQuery"></a>

## screencastify.decodeStateQuery([search]) ⇒ <code>Object</code>
___
Get decoded state query parameter.

**Returns**: <code>Object</code> - decoded state object or null.  
**Params**

- [search] <code>String</code> - query string, defaults to location.search.

<a name="screencastify.setAppId"></a>

## screencastify.setAppId(id)
___
Set your AppId (as shown in the API Console on screencastify.com) before using any other
library function.

**Params**

- id <code>String</code> - app id.

**Example**  
```js
screencastify.setAppId(YOUR_APP_ID);
```
<a name="screencastify..AudioConfig"></a>

## screencastify~AudioConfig : <code>Object</code>
___
Recording options

**Properties**

- mic <code>boolean</code> - Enable microphone recording.  
- system <code>boolean</code> - Enable system audio recording (only supported on windows).  

<a name="screencastify..SizeConfig"></a>

## screencastify~SizeConfig : <code>Object</code>
___
Size config object

**Properties**

- width <code>number</code> - width in pixels.  
- height <code>number</code> - height in pixels.  

<a name="screencastify..RecordConfig"></a>

## screencastify~RecordConfig : <code>Object</code>
___
Recording options

**Properties**

- audio <code>AudioConfig</code> - Audio options.  
- captureSource <code>String</code> - One of ['screen' or 'desktop']. 'desktop' allows the
user to pick the complete screen or any window, 'screen' only allows to pick the complete
screen.  
- startDelay <code>number</code> - Countdown [0, 10] in seconds before starting
recording. Defaults to 0.  
- maxFps <code>number</code> - FPS limit [1, 60] to use for recording.
Defaults to the user setting in the extension.  
- maxResolution <code>SizeConfig</code> - Resolution limit in
pixels ([64, 4096] for both dimensions). Note that this is an upper limit, the actual
resolution will scaled to fit into the given size. So it will usually be
lower, depending on the actual, native screen resolution. Defaults to the user
setting in the extension.  

<a name="screencastify..StartConfig"></a>

## screencastify~StartConfig : <code>Object</code>
___
Start recording configuration.

**Properties**

- recordConfig <code>RecordConfig</code> - recording options.  
- payload <code>String</code> - any string with a length of up to 1024 characters.  
- shareUrl <code>String</code> - URL that is opened to share the resulting file.
Defaults to the shareUrl configured in the API console. Required if no default is
configured.  

