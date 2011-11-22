require 'spec_helper'

describe 'Searching actions' do
  describe 'Tutorial search' do
    before do
      @tutorial_1 = Factory(:tutorial, :title => 'some cool devise')
      @tutorial_2 = Factory(:tutorial, :title => 'cancan tutorial')
      @tutorial_3 = Factory(:tutorial, :title => 'devise tutorial')
    end

    it 'Shows a list with only the searched tutorials', :js => true do
      visit find_tutorials_path()
      fill_in "search_q", :with => 'devise'
      page.evaluate_script("document.forms[0].submit()")
      within('#search_results') do
        page.should have_content @tutorial_1.title
        page.should have_content @tutorial_3.title
        page.should_not have_content @tutorial_2.title
      end
    end


    context 'When there are no tutorials that match the search' do
      it 'I can see a blank search field and apropiate feedback'
      it 'I can see a list with the top tutorials'
    end
  end

  describe 'Ruby Gem search' do
    it 'Shows a list with the searched ruby gems'
    context 'When there are no ruby gems that match the search' do
      it 'I can see a blank search field and apropiate feedback'
      it 'I can see a list with the top ruby gems'
    end
  end

  describe 'User search' do
    it 'Shows a list with the searched users'
    context 'When there are no users that match the search' do
      it 'I can see a blank search field and apropiate feedback'
      it 'I can see a list with the top users'
    end
  end

  describe 'General functionality' do
  end

end

