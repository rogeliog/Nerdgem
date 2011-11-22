require 'spec_helper'

describe 'Ruby Gem detail' do
  before do
    @info = {'info' => 'The gem info', 'authors' => 'The author', 
      'homepage_uri' => 'http://url.url', 'source_code_uri' => 'http://url.url'}
    @ruby_gem = Factory(:ruby_gem, :info => @info)

    @tutorials = []
    @ruby_gem.update_attributes({:info => @info})
    2.times{@tutorials.push Factory(:tutorial, :ruby_gems =>[@ruby_gem])}
    @other_tutorial = Factory(:tutorial, :title =>"The bad tutorial")
  end

  it 'Can see the ruby gem information' do
    visit ruby_gem_path(@ruby_gem)
    within('#gem') do
      page.should have_content(@info['info'])
      page.should have_content(@info['The gem info'])
      page.should have_content(@info['The author'])
      page.should have_content(@info['Homepage'])
    end
  end

  it 'Can see the tutorials related with the ruby gem' do
    visit ruby_gem_path(@ruby_gem)
    page.should have_content(@tutorials.first.title)
    page.should have_content(@tutorials.last.title)
    page.should_not have_content(@other_tutorial.title)
  end

end
