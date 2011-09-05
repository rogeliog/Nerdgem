require 'spec_helper'

describe 'Tutorial edit and creation' do

  describe 'Tutorial creation' do
    it 'Can create a tutorial' do
      visit new_tutorial_path
      fill_in "tutorial_title", :with => "The title"
      fill_in "tutorial_body", :with => "Some interesting body"
      click_on "Create Tutorial"
      current_path.should eq(tutorial_path(Tutorial.last))
      page_with_contents(["The title","Some interesting body","Successfully created tutorial."])
    end

    it 'Can\'t create a tutorial without a body' do
      visit new_tutorial_path
      fill_in "tutorial_body", :with => "Some interesting body"
      click_on "Create Tutorial"
      page.should have_content "Title can't be blank"
    end

    it 'Can\'t create a tutorial without a title' do
      visit new_tutorial_path
      fill_in "tutorial_title", :with => "Some interesting body"
      click_on "Create Tutorial"
      page.should have_content "Body can't be blank"
    end

    it 'Can see the markdown syntax guide within a lightbox', :js => true do
      visit new_tutorial_path
      click_link "markdown syntax"
      within("#fancybox-content #formatting_guide"){
        page.should have_content("Markdown styling guide");
      }
    end
  end

  describe 'Tutorial edition' do
    let(:tutorial){Factory(:tutorial)}

    it 'I can edit the tutorial information' do
      visit tutorial_path(tutorial)
      click_link "Edit"
      fill_in "tutorial_title", :with => "The new title"
      fill_in "tutorial_body", :with => "The new super body"
      click_on "Update Tutorial"
      current_path.should eql(tutorial_path(tutorial))
      page_with_contents(["The new title","The new super body","Successfully updated tutorial."])
    end
  end

end
