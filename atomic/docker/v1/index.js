var express = require('express')

var app =  express();
app.get('/', function (req, res) {
  var os = require("os");
  res.send('<h1>Hello World!</h1><br /><br />'+os.hostname()+'\n');
}

app.listen(8080);
console.log('Running on http://localhost:8080');
