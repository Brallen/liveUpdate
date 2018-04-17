styles = """
/*
 * Oh hello there. Welcome to my website!
 *                                                                              
 * What's going on right now was based on an idea
 * by Jake Albaugh
 *                                                              
 * This website is still in progress but the main
 * features are here. Have fun checking it out
 *                                                                       
 * The site is pretty bland right now as you can
 * tell so lets change that...                                                  
 */

pre{
  position: fixed;
  width: 30%;
  top: 63px; bottom: 30px; left: 35%;
  transition: left 500ms;
  overflow: hidden;
  background-color: #282c35;
  color: #8b97a4;
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

pre em:not(.comment){
  font-style: normal;
}
.comment{
  color: #4a4e56;
}
.selector{
  color: #ce8853;
}
.selector .key{
  color: #ce8853;
}
.key{
  color: #8b97a4;
}
.value{
  color: #1caebe;
}

/*
 * There we go. Now at least I look nice.
 *                                                                              
 * Let's move me over and then get some more
 * stuff on this page                                                                        
 */

pre{
  left: 69%;
}
body,html{
  margin:0;
  padding:0;
}
body{
  background-color: #fff6f5;
}

/*
 * I'm gonna cheat a little bit here                                            
 */

.hidden{
  display: block;
}

/*
 * Wow that html came up so fast! It's like
 * it was premade...                                                            
 *
 * Anyways back to work                                              
 */

a{
  text-decoration: none;
}
header{
  background-color: #269bfa;
  padding-top: 10px;
}
.sitetitle{
  margin:0 0 5px 10px;
  display: inline-block;
  text-decoration: none;
  color: white;
  font-family: 'Roboto', sans-serif;
  font-size: 2.5em;
}
.sitetitle:hover{
  color: #fff6f5;
}
.navbar{
  margin-top: 5px;
  margin-right: 5px;
  float: right;
  font-family: 'Roboto', sans-serif;
}
.navlink a{
  padding: 0 10px;
  text-decoration: none;
  color: white;
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
  font-size: 1.6em;
}
.active.navitem{
  border-bottom: 3px solid white;
}

/*
 * That's not looking too bad now.                                               
 * Let's get this other part looking nice                                       
 */

.images{
  max-width: 100%;
  display: block;
}
.container{
  background-image: linear-gradient(#279bfa 85%, #fff6f5 85%);
}
.infowrapper{
  margin: auto;
  margin-right: 33%;
  width: 65%;
  padding-top: 10px;
  display: flex;
  font-family: sans-serif;
}
.box{
  margin-top: 5px;
  padding: 0 35px;
  flex-basis: 66%;
  background-color: white;
  border-right: 1px #4a4e56;
  font-size: 1.1em;
}
.boximage{
  flex-basis: 33%;
  padding: 0;
}
.links{
  width: 100%;
  margin: 10px 0;
  text-align: center;
}
.links ul{
  margin: 0;
  padding-left: 0;
  list-style-type: none;
}
.linkitem{
  display: inline-block;
  margin: 0 2%;
  font-size: 1.6em;
}
.links a{
  color: black;
}

.bio p{
  margin: 0;
}

/*
 * Hey we did it!                                                               
 *
 * Feel free to check out the rest of the website
 * while you're here                                                            
 */
"""

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

writeStyles(styles, 0, 16)
