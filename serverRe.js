// Generated by CoffeeScript 2.1.0
(function() {
  //Author: Brett Case
  var cssStyle, fs, html404, htmlIndex, http, jsIndex, picture, port, server;

  fs = require("fs");

  http = require("http");

  port = process.env.PORT;

  //these are here so they'll be globals
  htmlIndex = null;

  cssStyle = null;

  html404 = null;

  jsIndex = null;

  picture = null;

  //##########################################################
  // cache Files
  //##########################################################
  //index.html
  fs.readFile('./public/index.html', 'utf8', function(err, data) {
    if (err) {
      console.log(err);
    }
    return htmlIndex = data;
  });

  //style.css
  fs.readFile('./public/style.css', 'utf8', function(err, data) {
    if (err) {
      console.log(err);
    }
    return cssStyle = data;
  });

  //index.html
  fs.readFile('./public/404.html', 'utf8', function(err, data) {
    if (err) {
      console.log(err);
    }
    return html404 = data;
  });

  //index.html
  fs.readFile('./public/index.js', 'utf8', function(err, data) {
    if (err) {
      console.log(err);
    }
    return jsIndex = data;
  });

  //index.html
  fs.readFile('./Images/me.jpeg', function(err, data) {
    if (err) {
      console.log(err);
    }
    return picture = data;
  });

  //##########################################################
  // Set up server Responses
  //##########################################################
  server = http.createServer(function(req, res) {
    console.log(req.url);
    switch (req.url) {
      case "/style.css":
        res.writeHead(200, {
          "Content-Type": "text/css"
        });
        res.write(cssStyle);
        break;
      case "/index.js":
        res.writeHead(200, {
          "Content-Type": "text/javascript"
        });
        res.write(jsIndex);
        break;
      case "/Images/me.jpeg":
        res.writeHead(200, {
          "Content-Type": "image/jpeg"
        });
        res.write(picture);
        break;
      case "/":
        res.writeHead(200, {
          "Content-Type": "text/html"
        });
        res.write(htmlIndex);
        break;
      case "/index.html":
        res.writeHead(200, {
          "Content-Type": "text/html"
        });
        res.write(htmlIndex);
        break;
      default:
        res.writeHead(404, {
          "Content-Type": "text/html"
        });
        res.write(html404);
    }
    return res.end();
  });

  //##########################################################
  // Make server listen
  //##########################################################
  if (port) {
    server.listen(port, function(err) {
      return console.log("Server running on port", port);
    });
  } else {
    server.listen(3000, function(err) {
      return console.log("Server Running on port 3000");
    });
  }

}).call(this);
