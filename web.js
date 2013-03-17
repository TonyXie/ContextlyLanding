require('coffee-script');

var $, EventEmitter, app, express, http, io, logger, names, socket;

express = require('express');
EventEmitter = require('events').EventEmitter;
http = require('http');
socket = require('socket.io');
$ = require('jquery');
logger = new EventEmitter();
app = express.createServer(express.logger());
io = socket.listen(app);

names = [];
messages = [];

app.set('view options', {layout: false});

app.get('/', function(request, response) {
  return response.render(__dirname + "/index.ejs", {
    names: names
  });
});

app.get('/', function(request, response) {
  response.send('Hello World!');
});

var port = process.env.PORT || 3000;
app.listen(port, function() {
  console.log("Listening on " + port);
});