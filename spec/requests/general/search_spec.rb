require 'spec_helper'

describe 'Searching actions' do
  describe 'Tutorial search' do
    before do
      @tutorial_1 = Factory(:tutorial, :title => 'some cool devise')
      @tutorial_2 = Factory(:tutorial, :title => 'cancan tutorial')
      @tutorial_3 = Factory(:tutorial, :title => 'devise tutorial')
    end

    it 'Shows a list with only the searched tutorials', :js => true do
      visit root_path
      fill_in "search_q", :with => 'devise'
      page.evaluate_script("document.forms[0].submit()")
      within('#search_results') do
        page.should have_content @tutorial_1.title
        page.should have_content @tutorial_3.title
        page.should_not have_content @tutorial_2.title
      end
    end


    context 'When there are no tutorials that match the search' do
      it 'I can see the apropiate feedback', :js => true do
        visit root_path
        fill_in "search_q", :with => 'Ruby on Rails'
        page.evaluate_script("document.forms[0].submit()")
        within('#search_results') do
          page.should have_content 'No match found, feel free to search again...'
        end


      end
      it 'I can see a list with the top tutorials', :js => true do
        visit root_path
        fill_in "search_q", :with => 'Ruby on Rails'
        page.evaluate_script("document.forms[0].submit()")
        within('#search_results') do
          Tutorial.top_tutorials.each do |tutorial|
            page.should have_content tutorial.title
          end
        end

      end
    end
  end

  describe 'Ruby Gem search' do
    before do
      @ruby_gem_1 = Factory(:ruby_gem, :name => 'Devise-2')
      @ruby_gem_2 = Factory(:ruby_gem, :name => 'Cancan')
      @ruby_gem_3 = Factory(:ruby_gem, :name => 'Devise')
      RubyGem.stub(:top_ruby_gems).and_return(RubyGem.limit(5))
    end

    it 'Shows a list with only the searched ruby_gems', :js => true do
      visit root_path
      fill_in "search_q", :with => 'devise'
      page.evaluate_script("document.forms[0].submit()")
      within('#search_results') do
        page.should have_content @ruby_gem_1.name
        page.should have_content @ruby_gem_3.name
        page.should_not have_content @ruby_gem_2.name
      end
    end


    context 'When there are no ruby_gems that match the search' do

      it 'I can see the apropiate feedback', :js => true do
        visit root_path
        fill_in "search_q", :with => 'Ruby on Rails'
        page.evaluate_script("document.forms[0].submit()")
        within('#search_results') do
          page.should have_content 'No match found, feel free to search again...'
        end


      end
      it 'I can see a list with the top ruby_gems', :js => true do
        visit root_path
        fill_in "search_q", :with => 'Ruby on Rails'
        page.evaluate_script("document.forms[0].submit()")
        click_link 'ruby_gems_tab_trigger'
        within('#search_results') do
          page.should have_content "Here are our top ruby gems"
          RubyGem.top_ruby_gems(5,0).each do |ruby_gem|
            page.should have_content ruby_gem.name
          end
        end

      end
    end
  end

  describe 'User search.' do
    before do
      @user_1 = Factory(:user, :name => 'Foo Bar')
      @user_2 = Factory(:user, :name => 'Dhh')
      @user_3 = Factory(:user, :name => 'Rogelio Bar')
    end

    it 'Shows a list with only the searched users', :js => true do
      visit root_path
      fill_in "search_q", :with => 'bar'
      page.evaluate_script("document.forms[0].submit()")
      within('#search_results') do
        page.should have_content @user_1.name
        page.should have_content @user_3.name
        page.should_not have_content @user_2.name
      end
    end


    context 'When there are no users that match the search.' do
      it 'I can see the apropiate feedback.', :js => true do
        visit root_path
        fill_in "search_q", :with => 'Ruby on Rails'
        page.evaluate_script("document.forms[0].submit()")
        within('#search_results') do
          page.should have_content 'No match found, feel free to search again...'
        end


      end
      it 'I can see a list with the top users.', :js => true do
        visit root_path
        fill_in "search_q", :with => 'Ruby on Rails'
        page.evaluate_script("document.forms[0].submit()")
        click_link 'users_tab_trigger'
        within('#search_results') do
          page.should have_content "Here are our top users"
          User.top_users(3).each do |user|
            page.should have_content user.name
          end
        end

      end
    end
  end

  describe 'General functionality' do
    before do
      @user_1 = Factory(:user, :name => 'Rogelio Bar')
      @user_2 = Factory(:user, :name => 'Rogelio Bar 2')
      @tutorial = Factory(:tutorial, :title => 'Bar tutorial')
    end

    it 'I see the tab with the most results active', :js => true do
      pending 
      visit root_path
      fill_in "search_q", :with => 'Bar'
      page.evaluate_script("document.forms[0].submit()")
      within('#search_results') do
        page.should have_content @user_1.name
        page.should have_content @user_2.name
        page.should_not have_content @tutorial.title
      end
    end

    it 'I can also see the results for the other categories by clicking the tab', :js => true do
      pending 
      visit root_path
      fill_in "search_q", :with => 'Bar'
      page.evaluate_script("document.forms[0].submit()")
      click_link 'tutorials_tab_trigger'
      within('#search_results') do
        page.should_not have_content @user_1.name
        page.should_not have_content @user_2.name
        page.should have_content @tutorial.title
      end

    end
  end

end

