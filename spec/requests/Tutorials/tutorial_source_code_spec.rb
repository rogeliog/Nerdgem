require 'spec_helper'

describe 'Tutorial Source Code' do
  before(:each) do
    sign_in
  end

  let(:tutorial){Factory(:tutorial, :user => User.last)}

  it 'I can upload the source code for a tutorial' do
    path = "#{Rails.root.to_s}/spec/support/uploads/sample_source_code"
    visit new_tutorial_path
    fill_in "tutorial_title", :with => "The title"
    fill_in "tutorial_body", :with => "Some interesting body"
    attach_file("tutorial_source_code", path)
    click_on "Create Tutorial"
    current_path.should eq(tutorial_path(Tutorial.last))
    page.should have_content("Download the source code")
  end

  it 'I can not view the source code for a tutorial with no source code' do
    path = "#{Rails.root.to_s}/spec/support/uploads/sample_source_code"
    visit new_tutorial_path
    fill_in "tutorial_title", :with => "The title"
    fill_in "tutorial_body", :with => "Some interesting body"
    click_on "Create Tutorial"
    current_path.should eq(tutorial_path(Tutorial.last))
    page.should_not have_content("Download the source code!")
  end


  it 'I can add a repo/code link to my tutorials' do
    visit new_tutorial_path
    fill_in "tutorial_title", :with => "The title"
    fill_in "tutorial_body", :with => "Some interesting body"
    fill_in "tutorial_repo_link", :with => "http://github.com/rogeliog/nerdgem"
    click_on "Create Tutorial"
    page.should have_content("Code repository")
  end

  it 'There is no code repository button when there is no repo link for the tutorial' do
    visit new_tutorial_path
    fill_in "tutorial_title", :with => "The title"
    fill_in "tutorial_body", :with => "Some interesting body"
    click_on "Create Tutorial"
    page.should_not have_content("Code repository")

  end



end

