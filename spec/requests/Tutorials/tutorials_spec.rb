require 'spec_helper'

describe "Tutorials" do
  # include Devise::TestHelpers
  before (:each) do
    # sign_in @user
    @tutorial_1 = Factory(:tutorial, :title => "Devise intro tutorial")
    @tutorial_2 = Factory(:tutorial, :title => "Cancan 123")
  end
  let(:user){@user}

  describe 'tutorials index recent list' do
    before do
    end

    it 'I can see a list of tutorials' do
      visit tutorials_path
      page.should have_content("Devise intro tutorial")
      page.should have_content("Cancan 123")
    end


    it 'The tutorials on the list should link to the show view' do
      visit tutorials_path
      click_link ("Devise intro tutorial")
      current_path.should eql(tutorial_path(@tutorial_1))
    end

    it 'I can see the related ruby gems for each tutorial' do
      visit tutorials_path
      page.should have_content(@tutorial_1.ruby_gems.first.name)
      page.should have_content(@tutorial_2.ruby_gems.first.name)
    end

  end
end
