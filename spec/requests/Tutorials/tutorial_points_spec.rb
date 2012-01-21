require 'spec_helper'

describe 'Tutorial Points' do
  before(:each) do
    sign_in
  end

  describe 'Tutorial point addition' do
    let(:tutorial){Factory(:tutorial)}


    describe 'As a user I can give a point to a tutorial' do
      it 'User can add one point to the tutorial' do
        visit tutorial_path tutorial
        within('#points'){page.should have_content('0')}
        click_link 'Add'
        within('#points'){page.should have_content('1')}
      end

      it "User can't add a point if he has already done it" do
        user = User.last
        tutorial.add_point user
        visit tutorial_path tutorial
        within('#points'){page.should_not have_content('Add')}
      end

    end

    describe 'As a user I can see the points a tutorial has' do
      before do 
        3.times{Factory(:point, tutorial: tutorial)}
      end
      it 'I can see the tutorial points on the index page' do
        visit root_path
        within('#points'){page.should have_content('3')}
      end

      it 'I can see the tutorial points on the show page' do
        visit root_path
        click_link tutorial.title
        within('#points'){page.should have_content('3')}
      end

    end

  end

end
