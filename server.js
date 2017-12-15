/*****************************************
 *Author: Brett Case
 *****************************************/

var fs = require("fs");
var http = require("http");
var port = process.env.PORT;

var htmlIndex;
var cssStyle;
var html404;
var jsIndex;

/*************** Cache Files ***************/
//index.html
fs.readFile('./public/index.html', 'utf8', function(err,data){
   if(err) console.log(err);
   htmlIndex = data;
});
//style.css
fs.readFile('./public/style.css', 'utf8', function(err,data){
   if(err) console.log(err);
   cssStyle = data;
});
//404.html
fs.readFile('./public/404.html', 'utf8', function(err,data){
   if(err) console.log(err);
   html404 = data;
});
//index.js
fs.readFile('./public/index.js', 'utf8', function(err,data){
   if(err) console.log(err);
   jsIndex = data;
});

/*************** Set Up Server Responses ***************/
var server = http.createServer(function (req, res) {
   console.log(req.url);
   switch (req.url) {
      case "/style.css":
	 res.writeHead(200, {"Content-Type": "text/css"});
	 res.write(cssStyle);
	 break;
      case "/index.js":
	 res.writeHead(200, {"Content-Type": "text/javascript"});
	 res.write(jsIndex);
	 break;
      case "/":
	 res.writeHead(200, {"Content-Type": "text/html"});
	 res.write(htmlIndex);
	 break;
      case "/index.html":
	 res.writeHead(200, {"Content-Type": "text/html"});
	 res.write(htmlIndex);
	 break;
      default:
	 res.writeHead(404, {"Content-Type": "text/html"});
	 res.write(html404);
   }
   res.end();
});

/*************** Make Server Listen ***************/
if(port){
   server.listen(port, function(err){console.log("Server running on port", port)});
}else{
   server.listen(3000, function(err){console.log("Server running on port 3000")});
}
