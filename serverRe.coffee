#Author: Brett Case

fs = require("fs")
http = require("http")
port = process.env.PORT

#these are here so they'll be globals
htmlIndex = null
cssStyle = null
html404 = null
jsIndex = null
picture = null

###########################################################
# cache Files
###########################################################
#index.html
fs.readFile('./public/index.html', 'utf8', (err, data) ->
    if err
      console.log(err)
    htmlIndex = data
)
#style.css
fs.readFile('./public/style.css', 'utf8', (err, data) ->
    if err
      console.log(err)
    cssStyle = data
)
#index.html
fs.readFile('./public/404.html', 'utf8', (err, data) ->
    if err
      console.log(err)
    html404 = data
)
#index.html
fs.readFile('./public/index.js', 'utf8', (err, data) ->
    if err
      console.log(err)
    jsIndex = data
)
#index.html
fs.readFile('./Images/me.jpeg', (err, data) ->
    if err
      console.log(err)
    picture = data
)

###########################################################
# Set up server Responses
###########################################################

server = http.createServer((req, res) ->
  console.log(req.url)
  switch req.url
    when "/style.css"
      res.writeHead(200, {"Content-Type": "text/css"})
      res.write(cssStyle)
    when "/index.js"
      res.writeHead(200, {"Content-Type": "text/javascript"})
      res.write(jsIndex)
    when "/Images/me.jpeg"
      res.writeHead(200, {"Content-Type": "image/jpeg"})
      res.write(picture)
    when "/"
      res.writeHead(200, {"Content-Type": "text/html"})
      res.write(htmlIndex)
    when "/index.html"
      res.writeHead(200, {"Content-Type": "text/html"})
      res.write(htmlIndex)
    else
      res.writeHead(404, {"Content-Type": "text/html"})
      res.write(html404)
  res.end()
)

###########################################################
# Make server listen
###########################################################
if port
  server.listen(port, (err) -> console.log("Server running on port", port))
else
  server.listen(3000, (err) -> console.log("Server Running on port 3000"))
