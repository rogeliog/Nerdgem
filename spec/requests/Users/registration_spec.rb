require 'spec_helper'



describe 'User Registration' do
  it 'I can register by clicking the Connect with github buttton', :js => true do
    visit root_path
    click_link "github_link"
    visit root_path
    page.should have_content 'Sign out'
  end
end
