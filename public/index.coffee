styles = """
pre {
  position: fixed; width: 30%;
  top: 48px; bottom: 30px; left: 35%;
  transition: left 500ms;
  overflow: auto;
  background-color: #282c35; color: #8b97a4;
  border: 1px solid rgba(0,0,0,0.2);
  padding: 24px 12px;
  box-sizing: border-box;
  border-radius: 3px;
  box-shadow: 0px 4px 0px 2px rgba(0,0,0,0.1);
}


/*
 * Colors are based on the One Dark theme
 * from Atom
 */

pre em:not(.comment) { font-style: normal; }

.comment       { color: #4a4e56; }
.selector      { color: #ce8853; }
.selector .key { color: #ce8853; }
.key           { color: #8b97a4; }
.value         { color: #1caebe; }

pre { left: 69%; }

body,html{
  margin:0;
  padding:0;
}
a{
  text-decoration: none;
}
body{
  background-color: #fff6f5;
}
.hidden{
  display: block;
}
header{
  background-color: #269bfa;
  padding-top: 10px;
}
.sitetitle{
  display: inline;
  text-decoration: none;
  color: white;
  font-family: 'Roboto', sans-serif;
  margin-left: 10px;
}
.sitetitle:hover{
  color: #fff6f5;
}
.navbar{
  float: right;
  font-family: 'Roboto', sans-serif;
}
.navlink a{
  text-decoration: none;
  color: white;
  padding: 0 10px;
}
.navlink a:hover{
  color: #fff6f5;
}
.navlist{
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
}
.navitem{
  display: inline block;
  float: left;
  margin-left: 20px;
  padding-bottom: 5px;
  padding-top: 3px;
  font-size: 20px;
}
.active.navitem{
  border-bottom: 3px solid white;
}
.images{
  max-width: 100%;
  display: block;
}
.container{
  background-image: linear-gradient(#279bfa 85%, #fff6f5 85%);
}
.infowrapper{
  margin: 0 32% 0 4%;
  padding-top: 10px;
  display: flex;
  font-family: sans-serif;
}
.box{
  margin-top: 5px;
  padding: 0 10px;
  flex-basis: 33%;
  background-color: white;
  border-right: 1px #4a4e56;
}
.boximage{
  padding: 0 0 0 10px;
}
.box ul{
  padding-left: 20px;
}"""

openComment = false

writeStyleChar = (which) ->
  # begin wrapping open comments
  if which == '/' && openComment == false
    openComment = true
    styles = $('#style-text').html() + which
  else if which == '/' && openComment == true
    openComment = false
    styles = $('#style-text').html().replace(/(\/[^\/]*\*)$/, '<em class="comment">$1/</em>')
  # wrap style declaration
  else if which == ':'
    styles = $('#style-text').html().replace(/([a-zA-Z- ^\n]*)$/, '<em class="key">$1</em>:')
  # wrap style value
  else if which == ';'
    styles = $('#style-text').html().replace(/([^:]*)$/, '<em class="value">$1</em>;')
  # wrap selector
  else if which == '{'
    styles = $('#style-text').html().replace(/(.*)$/, '<em class="selector">$1</em>{')
  else
    styles = $('#style-text').html() + which
  $('#style-text').html styles
  $('#style-tag').append which

writeStyles = (message, index, interval) ->
  if index < message.length
    pre = document.getElementById 'style-text'
    pre.scrollTop = pre.scrollHeight
    writeStyleChar message[index++]
    setTimeout (->
      writeStyles message, index, interval
    ), interval

$('body').append """
  <style id="style-tag"></style>
	<pre id="style-text"></pre>
"""
time = if window.innerWidth <= 578 then 4 else 16

# starting it off
writeStyles(styles, 0, time)
