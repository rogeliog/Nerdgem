require 'spec_helper'

describe 'Tutorial Delete' do

  it 'Can delete a tutorial when I am the owner', :js => true do
    sign_in
    user = User.last
    tutorial = Factory(:tutorial, :user => user )
    visit root_path
    click_link tutorial.title
    page.evaluate_script("window.alert = function(msg) { return true; }")
    page.evaluate_script("window.confirm = function(msg) { return true; }")
    click_link "Delete"
    page.should have_content "Successfully destroyed tutorial."
  end
  
  it 'Can not delete a tutorial when I am not the owner', :js => true do
    sign_in
    user = Factory(:user)
    tutorial = Factory(:tutorial, :user => user )
    visit root_path
    click_link tutorial.title
    page.should_not have_content("Delete")
  end
 
end
