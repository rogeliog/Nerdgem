require 'spec_helper'

describe 'Markdown syntax for tutorial' do

  before do
    @html_body = "This is a simple body\n## And this will become an h2\n * But this is a list item"
    @code_body = "~~~.ruby\n  puts 'chino' \n~~~"
  end
  it 'can add HTML tags to the tutorial body with markdown' do
    visit new_tutorial_path
    fill_in "tutorial_title", :with => "The title"
    fill_in "tutorial_body", :with => @html_body
    click_on "Create Tutorial"
    within('#tutorial h2'){ page.should have_content("And this will become an h2")}
    within('#tutorial li'){ page.should have_content("But this is a list item")}
  end

  it 'can add code blocks to the tutorial body with markdown' do
    visit new_tutorial_path
    fill_in "tutorial_title", :with => "The title"
    fill_in "tutorial_body", :with => @code_body
    click_on "Create Tutorial"
    within('#tutorial .highlight'){ page.should have_content("puts 'chino'") }
  end

  it 'should see a simple markdown syntax tutorial on the tutorial form' do
    visit new_tutorial_path
    within("#markdown_tutorial") do
      page.should have_content("h1")
      page.should have_content("h2")
      page.should have_content("h3")
      page.should have_content("bullets")
      page.should have_content("lists")
      page.should have_content("links")
      page.should have_content("code")
      page.should have_content("Full Markdown documentation")
    end
  end

end
