$(document).ready ->

  # method for flashing in and out 
  flashInOut = (id, callback) ->
    id = "#" + id
    $(id).fadeIn 1500, ->
      $(this).fadeOut()
    if callback then callback()

  $("#quill").animate {"left" : "1150%"}, 1500, "linear", ->
    flashInOut("changeFontFlash") 
    $('.jumbotron h3').css("font-size", "150px")
    $('.jumbotron h3').css("font-family", "Open Sans")

  $("#quill").animate {"top" : "65px"}, 1500, "linear", ->
    flashInOut "resizableFlash", ->
      $(".jumbotron").animate {"height": "312px"}, 1500, "linear"
      $("#quill").animate {"top": "275px"}, 1500, "linear"
    $("#quill").animate {"top": "245px"}, 1500, "linear", ->
      flashInOut("addToClassFlash")
      $('#addTarget').append('<p>Shift + A: Add the clicked element to a specified class.</p>')
      $('#addObject').css("opacity", "0")
      $('#quill').animate {"left" : "-120px", "top" : "325px"}, 1500, "linear", ->
        flashInOut("draggableFlash")
        $('#myDrag').animate {"left": "0px"}, 1500, "linear"
        $('#quill').animate {"left": "180px"}, 1500, "linear", -> 
          $('#quill').animate {"left": "1300%", "top": "230px"}, 1500, "linear", ->
          $('#ContextlyLoadedFlash').fadeIn()

  # remove the "you can demo it now!" flash when user presses shift + H
  $(document).bind 'keypress', (e) ->

    # Display help menu
    if event.shiftKey and event.which is 72
      $('#ContextlyLoadedFlash').fadeOut()


