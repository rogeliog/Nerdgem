$(function() {
  $("#tutorial_ruby_gem_tokens").tokenInput("/ruby_gems.json", {
    crossDomain: false,
    preventDuplicates: true,
    prePopulate: $("#book_author_tokens").data("pre")
  });
});

$(document).ready(function() { 

  $(".admin_links").live("click",function(){
      $("#content .tutorial_show").fadeOut();
      setTimeout(function() {$("#tutorial_wrapper").fadeIn();}, 500);
      // $("#content .tutorial_show").fadeOut();
      // setTimeout(function() {$("#tutorial_wrapper").fadeIn();}, 500);
  });

  $(".tutorial").click(function(){
    var id = $(this).attr('tutorial_id');
    $.getJSON("/tutorials/"+ id, function(data) {
      $.each(data,function(){
        $("#content .tutorial_show").html(tutorial_template(this)).hide();
      });
      $("#tutorial_wrapper").fadeOut(500);
      setTimeout(function() {$("#content .tutorial_show").fadeIn();}, 500);
    });
  });

});
function tutorial_template(tutorial) {
  return "<div class='admin_links'><a id='back_to_all' href='#'> View all</a></div> <h2>" + tutorial.title + "</h2><div>" 
         + tutorial.markdown_body + "</div>";
}

