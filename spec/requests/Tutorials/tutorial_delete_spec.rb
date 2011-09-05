require 'spec_helper'

describe 'Tutorial Delete' do
  let(:tutorial){Factory(:tutorial)}
  it 'Can delete a tutorial', :js => true do
    page.evaluate_script("window.alert = function(msg) { return true; }")
    page.evaluate_script("window.confirm = function(msg) { return true; }")
    visit root_path
    save_and_open_page
    click_link tutorial.title
    click_link "Delete"
    visit root_path
    page.should_not have_content(tutorial.title)
  end
end
