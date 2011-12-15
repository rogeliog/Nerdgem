require 'spec_helper'


describe 'Tutotrial estimated time' do
  before(:each) do
    sign_in
  end

  let(:tutorial){Factory(:tutorial, :user => User.last)}

  it 'I can add the estimated time to a tutorial' do
    visit new_tutorial_path
    fill_in "tutorial_title", :with => "The title"
    select "Between 30 and 60 minutes", :from => "tutorial_estimated_time"
    fill_in "tutorial_body", :with => "Some interesting body"
    click_on "Create Tutorial"
    current_path.should eq(tutorial_path(Tutorial.last))
    page.should have_content("Between 30 and 60 minutes")
  end

  it 'I can edit the estimated time of a tutorial' do
    visit edit_tutorial_path tutorial
  
    select "Less than 15 minutes", :from => "tutorial_estimated_time"
    click_on "Update Tutorial"
    page.should_not have_content("Between 30 and 60 minutes")
    page.should have_content("Less than 15 minutes")
  end

  it 'I can view the estimated time of a tutorial' do
    visit tutorial_path tutorial
    page.should have_content("Between 30 and 60 minutes")
  end
end
