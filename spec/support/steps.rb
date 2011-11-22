module Steps
  def page_with_contents(contents)
    contents.each { |c| page.should have_content c }
  end
  
  def sign_in
    visit root_path
    click_link 'github_link'
  end
end
