var express = require('express');

var app = express.createServer(express.logger());

app.set("view options", {
  layout: false
});

app.use(express.static(__dirname)); // This line.

app.get('/', function(request, response) {
  response.render(__dirname + "/index.ejs");
});

var port = process.env.PORT || 3000;
app.listen(port, function() {
  console.log("Listening on " + port);
});