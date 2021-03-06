
require 'spec_helper'

describe 'Markdown syntax for tutorial' do
  before do
    @html_body = "This is a simple body\n## And this will become an h2\n * But this is a list item"
    @code_body = "~~~.ruby\n  puts 'chino' \n~~~"
    sign_in
  end
  it 'Can add HTML tags to the tutorial body with markdown' do

    visit new_tutorial_path
    fill_in "tutorial_title", :with => "The title"
    fill_in "tutorial_body", :with => @html_body
    click_on "Create Tutorial"
    within('#tutorial h2'){ page.should have_content("And this will become an h2")}
    within('#tutorial li'){ page.should have_content("But this is a list item")}
  end

  it 'Can add code blocks to the tutorial body with markdown' do
    visit new_tutorial_path
    fill_in "tutorial_title", :with => "The title"
    fill_in "tutorial_body", :with => @code_body
    click_on "Create Tutorial"
    within('#tutorial .highlight'){ page.should have_content("puts 'chino'") }
  end

  it 'Should see a simple markdown syntax tutorial on the tutorial form' do
    visit new_tutorial_path
    click_link "markdown syntax"
    within("#formatting_guide") do
      page.should have_content("#")
      page.should have_content("##")
      page.should have_content("Bullet")
      page.should have_content("First element")
      page.should have_content("For an advanced guide Click here")
    end
  end

  describe 'Preview' do
    it 'Can add HTML tags to the tutorial and preview it with markdown syntax', :js => true do
      visit new_tutorial_path
      fill_in "tutorial_body", :with => @html_body
      within('#tutorial_preview h2'){ page.should have_content("And this will become an h2")}
      within('#tutorial_preview li'){ page.should have_content("But this is a list item")}
    end

    it 'Can add code blocks to the tutorial and preview it with markdown syntax', :js => true do
      visit new_tutorial_path
      fill_in "tutorial_body", :with => @code_body
      within('#tutorial_preview .highlight'){ page.should have_content("puts 'chino'") }
    end

  end
end
