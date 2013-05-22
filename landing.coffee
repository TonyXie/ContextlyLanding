$(document).ready ->

#############################################################################
#############################################################################
############################# INJECTED FLASH MESSAGES #######################
#############################################################################
#############################################################################

  $('body').append('
    <div id="contextlyFlashesHolder"></div>
    ')

  # Contextly loaded flash message 
  $('#contextlyFlashesHolder').prepend('
     <div id="ContextlyLoadedFlash" class="hide alert alert-success" style="
    z-index: 10000000;
    position: fixed;
    left: 41%;
    top: 2%;
    width: 200px;
      ">
      <a class="close" id= "closeMyFlash" href="#">×</a>
      <p>Contextly Loaded into page. Press shift + H to begin.</p>
    </div>
    ')

  # info flash messages 
  $('#contextlyFlashesHolder').prepend('
     <div id="draggableFlash" class="hide alert alert-success" style="
    z-index: 10000000;
    position: fixed;
    left: 41%;
    top: 2%;
    width: 200px;
      ">
      <a class="close" id= "closeMyFlash" href="#">×</a>
      <p>Element made draggable</p>
    </div>
    ')

  # info change font message
  $('#contextlyFlashesHolder').prepend('
     <div id="changeFontFlash" class="hide alert alert-success" style="
    z-index: 10000000;
    position: fixed;
    left: 41%;
    top: 2%;
    width: 200px;
      ">
      <a class="close" id= "closeMyFlash" href="#">×</a>
      <p>Font changed</p>
    </div>
    ')

  # info wrap class messages 
  $('#contextlyFlashesHolder').prepend('
     <div id="wrapClassFlash" class="hide alert alert-success" style="
    z-index: 10000000;
    position: fixed;
    left: 41%;
    top: 2%;
    width: 230px;
      ">
      <a class="close" id= "closeMyFlash" href="#">×</a>
      <p>Element wrapped in specified div</p>
    </div>
    ')

  # info add to div messages 
  $('#contextlyFlashesHolder').prepend('
     <div id="addToClassFlash" class="hide alert alert-success" style="
    z-index: 10000000;
    position: fixed;
    left: 41%;
    top: 2%;
    width: 230px;
      ">
      <a class="close" id= "closeMyFlash" href="#">×</a>
      <p>Element added to specified div</p>
    </div>
    ')

  # info change tagName messages 
  $('#contextlyFlashesHolder').prepend('
     <div id="changeTagNameFlash" class="hide alert alert-success" style="
    z-index: 10000000;
    position: fixed;
    left: 41%;
    top: 2%;
    width: 200px;
      ">
      <a class="close" id= "closeMyFlash" href="#">×</a>
      <p>Element\'s tagName changed</p>
    </div>
    ')

  # info modify class messages 
  $('#contextlyFlashesHolder').prepend('
     <div id="modifyClassFlash" class="hide alert alert-success" style="
    z-index: 10000000;
    position: fixed;
    left: 41%;
    top: 2%;
    width: 200px;
      ">
      <a class="close" id= "closeMyFlash" href="#">×</a>
      <p>Class changed</p>
    </div>
    ')

  # info resizable messages 
  $('#contextlyFlashesHolder').prepend('
     <div id="resizableFlash" class="hide alert alert-success" style="
    z-index: 10000000;
    position: fixed;
    left: 41%;
    top: 2%;
    width: 200px;
      ">
      <a class="close" id= "closeMyFlash" href="#">×</a>
      <p>Element made resizable</p>
    </div>
    ')

  # info revert messages 
  $('#contextlyFlashesHolder').prepend('
     <div id="revertFlash" class="hide alert alert-success" style="
    z-index: 10000000;
    position: fixed;
    left: 41%;
    top: 2%;
    width: 200px;
      ">
      <a class="close" id= "closeMyFlash" href="#">×</a>
      <p>Change reverted</p>
    </div>
    ')

  # info fail revert messages 
  $('#contextlyFlashesHolder').prepend('
     <div id="failRevertFlash" class="hide alert alert-error" style="
    z-index: 10000000;
    position: fixed;
    left: 41%;
    top: 2%;
    width: 200px;
      ">
      <a class="close" id= "closeMyFlash" href="#">×</a>
      <p>No changes to revert</p>
    </div>
    ')

  # method for flashing in and out 
  flashInOut = (id, callback) ->
    id = "#" + id
    $(id).fadeIn 1500, ->
      $(this).fadeOut()
    if callback then callback()

  $("#quill").animate {"left" : "-30px", "top" : "-280px"}, 1500, "linear", ->
    flashInOut("changeFontFlash") 
    $('.jumbotron h3').css("font-size", "150px")
    $('.jumbotron h3').css("font-family", "Open Sans")

  $("#quill").animate {"left" : "-27px", "top" : "-232px"}, 1500, "linear", ->
    flashInOut "resizableFlash", ->
      $(".jumbotron").animate {"height": "312px"}, 1500, "linear"
      $("#quill").animate {"top": "-20px"}, 1500, "linear"
    $("#quill").animate {"top": "-55px"}, 1500, "linear", ->
      flashInOut("addToClassFlash")
      $('#addTarget').append('<p>Shift + A: Add the clicked element to a specified class.</p>')
      $('#addObject').css("opacity", "0")
      $('#quill').animate {"left" : "75px", "top" : "-70px"}, 1500, "linear", ->
      flashInOut("draggableFlash")
      $('#myDrag').animate {"left": "0px"}, 1500, "linear", ->
        $('#ContextlyLoadedFlash').fadeIn()

  # remove the "you can demo it now!" flash when user presses shift + H
  $(document).bind 'keypress', (e) ->

    # Display help menu
    if event.shiftKey and event.which is 72
      $('#ContextlyLoadedFlash').fadeOut()


