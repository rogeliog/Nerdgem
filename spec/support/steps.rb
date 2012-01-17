module Steps
  def page_with_contents(contents)
    contents.each { |c| page.should have_content c }
  end
  def page_with_image(image)
    page.should have_xpath("//img[contains(@src, \"#{image}\")]")
  end

  def sign_in
    visit root_path
    click_link 'github_link'
    User.last
  end

  def press_enter_on(field)
    find_field(field).native.send_key(:enter)
  end

end
