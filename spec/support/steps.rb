module Steps
  def page_with_contents(contents)
    contents.each { |c| page.should have_content c }
  end
end
