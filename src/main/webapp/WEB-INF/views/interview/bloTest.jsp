<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/commonLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script>
const constraints = { "video": { width: { max: 320 } }, "audio" : true };

var theStream;
var theRecorder;
var recordedChunks = [];

function startFunction() {
  navigator.mediaDevices.getUserMedia(constraints)
      .then(gotMedia)
      .catch(e => { console.error('getUserMedia() failed: ' + e); });
}

function gotMedia(stream) {
  theStream = stream;
  var video = document.querySelector('video');
  video.srcObject = stream;
  try {
    recorder = new MediaRecorder(stream, {mimeType : "video/webm"});
  } catch (e) {
    console.error('Exception while creating MediaRecorder: ' + e);
    return;
  }
  
  theRecorder = recorder;
  recorder.ondataavailable = 
      (event) => { recordedChunks.push(event.data); };
  recorder.start(100);
}

// From @samdutton's "Record Audio and Video with MediaRecorder"
// https://developers.google.com/web/updates/2016/01/mediarecorder
function download() {
  theRecorder.stop();
  theStream.getTracks().forEach(track => { track.stop(); });

  var blob = new Blob(recordedChunks, {type: "video/webm"});
  var url =  URL.createObjectURL(blob);
  var a = document.createElement("a");
  document.body.appendChild(a);
  a.style = "display: none";
  a.href = url;
  a.download = 'test.webm';
  a.click();
  // setTimeout() here is needed for Firefox.
  setTimeout(function() { URL.revokeObjectURL(url); }, 100); 
}


</script>
</head>
<body>
	<p>
		<video id="video" autoplay width=320 />
	<p>
	<p>
		<button onclick="startFunction()">Grab video & start
			recording</button>
	</p>
	<p>
		<button onclick="download()">Download! (and stop video)</button>
	</p>
</body>
</html>