`$(function() {
  $("#tutorial_ruby_gem_tokens").tokenInput("/ruby_gems.json", {
    crossDomain: false,
    preventDuplicates: true,
    prePopulate: $("#book_author_tokens").data("pre")
  });
});
`
$(document).ready ->


  # setInterval ->
    body = $('#tutorial_body').val()
    `$.getJSON("/preview.json", { body: ""+body+""},
        function(data) {
          alert("Data Loaded: " + data);
      });`
  # ,5000
  # $(".admin_links").live  "click",->
  #   $("#content .tutorial_show").fadeOut()
  #   setTimeout -> $("#tutorial_wrapper").fadeIn(),
  #   500
    
  # $(".tutorial").click ->
  #   id = $(@).attr 'tutorial_id'
  #   $.getjson "/tutorials/" + id, (data)->
  #     $.each data, ->
  #       $("#content .tutorial_show").html(tutorial_template @).hide
  #     $("#tutorial_wrapper").fadeOut 500
  #     setTimeout -> $("#content .tutorial_show").fadeIn()

  # tutorial_template = (tutorial) ->
  #   "<div class='admin_links'><a id='back_to_all' href='#'> View all</a>  </div> <h2>" + tutorial.title + "</h2><div>" + tutorial.markdown_body + "</div>"
  
