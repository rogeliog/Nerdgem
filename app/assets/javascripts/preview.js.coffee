$(document).ready ->
  prev_body=""
  body = $('#tutorial_body').val()
  $.post('/preview', {body: body})

  setInterval ->
    body = $('#tutorial_body').val()
    if body != prev_body
      prev_body = body
      $.post('/preview', {body: body})
  ,2000
