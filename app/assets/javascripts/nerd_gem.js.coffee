`$(function() {
  $("#tutorial_ruby_gem_tokens").tokenInput("/ruby_gems.json", {
    crossDomain: false,
    preventDuplicates: true,
    prePopulate: $("#book_author_tokens").data("pre")
  });
});
`
