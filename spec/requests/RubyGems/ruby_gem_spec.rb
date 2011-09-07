require 'spec_helper'

describe 'Ruby Gem detail' do
  before do
    @info = {'info' => 'The gem info', 'authors' => 'The author', 
      'homepage_uri' => 'http://url.url', 'source_code_uri' => 'http://url.url'}
  end
  let(:ruby_gem){Factory(:ruby_gem, :info => @info)}

  it 'Can see the ruby gem information' do
    ruby_gem.update_attributes({:info => @info})
    visit ruby_gem_path(ruby_gem)
    within('#gem') do
      page.should have_content(@info['info'])
      page.should have_content(@info['The gem info'])
      page.should have_content(@info['The author'])
      page.should have_content(@info['Homepage'])
    end
  end

end
