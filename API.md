# API Reference
<a name="screencastify"></a>
## screencastify

* [screencastify](#screencastify)
  * _static_
    * [.Recorder()](#screencastify.Recorder)
      * [.state](#screencastify.Recorder+state) : <code>String</code>
      * [.state](#screencastify.Recorder+state) : <code>number</code>
      * [.start(config)](#screencastify.Recorder+start) ⇒ <code>Promise</code>
      * [.stop()](#screencastify.Recorder+stop) ⇒ <code>Promise</code>
      * [.pause()](#screencastify.Recorder+pause) ⇒ <code>Promise</code>
      * [.resume()](#screencastify.Recorder+resume) ⇒ <code>Promise</code>
    * [.isAppConnected()](#screencastify.isAppConnected) ⇒ <code>Promise</code>
    * [.getFile(fileId)](#screencastify.getFile) ⇒ <code>Promise</code>
    * [.connectApp()](#screencastify.connectApp) ⇒ <code>Promise</code>
    * [.isBrowserSupported()](#screencastify.isBrowserSupported) ⇒ <code>boolean</code>
    * [.isInstalled()](#screencastify.isInstalled) ⇒ <code>String</code>
    * [.decodeStateQuery([search])](#screencastify.decodeStateQuery) ⇒ <code>Object</code>
    * [.setAppId(id)](#screencastify.setAppId)
  * _inner_
    * [~AudioConfig](#screencastify..AudioConfig) : <code>Object</code>
    * [~RecordConfig](#screencastify..RecordConfig) : <code>Object</code>
    * [~StartConfig](#screencastify..StartConfig) : <code>Object</code>

<a name="screencastify.Recorder"></a>
### screencastify.Recorder()
Recorder controller. Instances can attach

**Params**


  * [.Recorder()](#screencastify.Recorder)
    * [.state](#screencastify.Recorder+state) : <code>String</code>
    * [.state](#screencastify.Recorder+state) : <code>number</code>
    * [.start(config)](#screencastify.Recorder+start) ⇒ <code>Promise</code>
    * [.stop()](#screencastify.Recorder+stop) ⇒ <code>Promise</code>
    * [.pause()](#screencastify.Recorder+pause) ⇒ <code>Promise</code>
    * [.resume()](#screencastify.Recorder+resume) ⇒ <code>Promise</code>

<a name="screencastify.Recorder+state"></a>
#### recorder.state : <code>String</code>
Current recorder state. String out of ['inactive', 'recording', 'paused'].

<a name="screencastify.Recorder+state"></a>
#### recorder.state : <code>number</code>
Current recorder time in seconds.

<a name="screencastify.Recorder+start"></a>
#### recorder.start(config) ⇒ <code>Promise</code>
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
    recordingConfig: {
      audio: {mic: true}
    }
  }).then(function() {
  console.log('recording started');
});
```
<a name="screencastify.Recorder+stop"></a>
#### recorder.stop() ⇒ <code>Promise</code>
Stop recording.

**Returns**: <code>Promise</code> - resolves when recording has been stopped / rejects on errors.  
<a name="screencastify.Recorder+pause"></a>
#### recorder.pause() ⇒ <code>Promise</code>
Pause recording.

**Returns**: <code>Promise</code> - resolves when recording has been paused / rejects on errors.  
<a name="screencastify.Recorder+resume"></a>
#### recorder.resume() ⇒ <code>Promise</code>
Resume recording after it has been paused.

**Returns**: <code>Promise</code> - resolves when recording has been resumed / rejects on errors.  
<a name="screencastify.isAppConnected"></a>
### screencastify.isAppConnected() ⇒ <code>Promise</code>
Check if App is connected. Returns false if platform is unsupported or extension not
installed.

**Returns**: <code>Promise</code> - that resolves with boolean result.  
<a name="screencastify.getFile"></a>
### screencastify.getFile(fileId) ⇒ <code>Promise</code>
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
  title: 'Test Name'  // file title set by user
  payload: 'some string '  // string set with recorder.start()
});
```
<a name="screencastify.connectApp"></a>
### screencastify.connectApp() ⇒ <code>Promise</code>
Connect your App to Screencastify.
This opens a popup window, so only call this in event handlers.
It takes care of installing Screencastify first, if it is not installed yet.

**Returns**: <code>Promise</code> - it returns a Promise that resolves on success or rejects on error.  
<a name="screencastify.isBrowserSupported"></a>
### screencastify.isBrowserSupported() ⇒ <code>boolean</code>
Check if browser is supported.

**Returns**: <code>boolean</code> - true if supported.  
<a name="screencastify.isInstalled"></a>
### screencastify.isInstalled() ⇒ <code>String</code>
Check if extension is installed.

**Returns**: <code>String</code> - version if installed, false else.  
<a name="screencastify.decodeStateQuery"></a>
### screencastify.decodeStateQuery([search]) ⇒ <code>Object</code>
Get decoded state query parameter.

**Returns**: <code>Object</code> - decoded state object or null.  
**Params**
- [search] <code>String</code> - query string, defaults to location.search.

<a name="screencastify.setAppId"></a>
### screencastify.setAppId(id)
Set your AppId (as shown in the API Console on screencastify.com) before using any other
library function.

**Params**
- id <code>String</code> - app id.

**Example**  
```js
screencastify.setAppId(YOUR_APP_ID);
```
<a name="screencastify..AudioConfig"></a>
### screencastify~AudioConfig : <code>Object</code>
Recording options

**Properties**

- mic <code>boolean</code> - Enable microphone recording.  
- system <code>boolean</code> - Enable system audio recording (only supported on windows).  

<a name="screencastify..RecordConfig"></a>
### screencastify~RecordConfig : <code>Object</code>
Recording options

**Properties**

- audio <code>AudioConfig</code> - Audio options.  
- captureSource <code>String</code> - One of ['screen' or 'desktop']. 'desktop' allows the
user to pick the complete screen or any window, 'screen' only allows to pick the complete
screen.  

<a name="screencastify..StartConfig"></a>
### screencastify~StartConfig : <code>Object</code>
Start recording configuration.

**Properties**

- recordConfig <code>RecordConfig</code> - recording options.  
- payload <code>String</code> - any string with a length of up to 1024 characters.  
- shareUrl <code>String</code> - URL that is opened to share the resulting file.
Defaults to the shareUrl configured in the API console. Required if no default is
configured.  

