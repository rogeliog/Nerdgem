`$(document).ready(function() {
  $(function() {
    $("#tutorial_ruby_gem_tokens").tokenInput("/ruby_gems.json", {
      crossDomain: false,
      preventDuplicates: true,
      prePopulate: $("#book_author_tokens").data("pre")
    });
  });
});
`
$(document).ready ->
  $("a#inline").fancybox()
  $('#dropdown-toggle').click (e)->
    e.preventDefault()
    $('#profile-dropdown').toggleClass 'open'

    






