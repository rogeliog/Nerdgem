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

  it 'Shows me the user points' do
    sign_in
    user = User.find_by_name USER['name']
    tutorial = Factory(:tutorial, user: user)
    tutorial_2 = Factory(:tutorial, user: user)
    2.times{Factory(:point, tutorial: tutorial)}
    3.times{Factory(:point, tutorial: tutorial_2)}
    click_link USER['name']
    within('#user') { page.should have_content("5")}
  end

end

