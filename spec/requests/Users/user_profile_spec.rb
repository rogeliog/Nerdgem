require 'spec_helper'

describe 'User Profile' do
  it 'Shows the user info' do
    sign_in
    click_link USER['name']
    page.should have_content "Your profile"
    within '#user' do
      page.should have_content USER['email']
      page.should have_content USER['name']
      page_with_image 'rails.png'
    end
  end

  it 'Show the users tutuorials' do
    user = sign_in
    click_link USER['name']
    Factory(:tutorial, :user => user)
    within '#user' do
      user.tutorials do |tutorial|
        page.should have_content tutorial.title
      end
    end
  end

end
