var express = require('express');
var http = require('http');
var app = express();
app.set("trust proxy", true);
app.set('port', 3001);
app.get('/video', showMenu);
app.get('/video/start', start_stream);
app.get('/video/stop', stop_stream);

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});


function showMenu(req, res) {
  res.send('<html><body><p>Your ip is '+req.ip+'</p><br /><a href="/video/start">Start Video Stream</a><br /><a href="/video/stop">Stop Video Stream</a></body></html>');
}

function cmd_exec(cmd, args, cb_stdout, cb_end) {
  var spawn = require('child_process').spawn,
    child = spawn(cmd, args),
    me = this;
  me.exit = 0;  // Send a cb to set 1 when cmd exits
  child.stdout.on('data', function (data) { cb_stdout(me, data); });
  child.stdout.on('end', function () { cb_end(me); });
}

function start_stream(req, res) {
    new cmd_exec('/home/root/streamz/stream.sh', ['start',req.ip], 
      function (me, data) {me.stdout += data.toString();},
      function (me) {me.exit = 1;}
    );
    res.send('<html><body><p>Video stream should start shortly at address '+req.ip+':4000</p><br /><a href="/video/stop">Stop Video Stream</a></body></html>');
}

function stop_stream(req, res) {
    new cmd_exec('/home/root/streamz/stream.sh', ['stop',req.ip], 
      function (me, data) {me.stdout += data.toString();},
      function (me) {me.exit = 1;}
    );
    showMenu(req, res);
}

