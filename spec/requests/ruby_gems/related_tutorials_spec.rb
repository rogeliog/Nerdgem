require 'spec_helper'

describe 'Ruby Gem related tutorials' do
  context 'When the ruby gem has tutorials' do
    before do
      @tutorial_1 = Factory(:tutorial, :title => 'Some cool title')
      @tutorial_2 = Factory(:tutorial, :title => 'Cancan tutorial')
      @tutorial_3 = Factory(:tutorial, :title => 'Devise tutorial')
      @ruby_gem = Factory(:ruby_gem, :tutorials => [@tutorial_1, @tutorial_2])
    end
    it 'I can see the related tutorials' do
      visit ruby_gem_path(@ruby_gem)
      page_with_contents [@tutorial_1.title, @tutorial_1.user.name, @tutorial_2.title, @tutorial_2.user.name]
    end
    it 'I can not see the tutorials that are not related' do
      visit ruby_gem_path(@ruby_gem)
      page.should_not have_content(@tutorial_3.title)
      page.should_not have_content(@tutorial_3.user.name)
    end
  end

  context 'When the ruby gem does not has any tutorials' do
    before do
      @tutorial_1 = Factory(:tutorial, :title => 'Cancan tutorial')
      @tutorial_2 = Factory(:tutorial, :title => 'Devise tutorial')
      @ruby_gem = Factory(:ruby_gem)
    end
    it 'I can not see any tutorial' do
      visit ruby_gem_path(@ruby_gem)
      
      page.should_not have_content(@tutorial_1.title)
      page.should_not have_content(@tutorial_2.title)
    end
  end

end
