require 'spec_helper'

describe 'Tutorial detail' do

  it 'Shows the tutorial detail' do
    tutorial = Factory(:tutorial)
    visit tutorial_path(tutorial)
    page.should have_content tutorial.title
    page.should have_content tutorial.body
  end

end
