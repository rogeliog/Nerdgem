

require 'spec_helper'
describe Tutorial do

  before do
    @tutorial = Factory(:tutorial)
  end

  context 'Validations' do
    context 'Is valid' do
      it 'With all parameters' do
        @tutorial.should be_valid
      end
    end

    context 'Is not valid' do
      it 'Without a title' do
        @tutorial.title = nil
        @tutorial.should_not be_valid
      end
      it 'Without a body' do
        @tutorial.body = nil
        @tutorial.should_not be_valid
      end
      it 'Without a user' do
        @tutorial.user_id = nil
        @tutorial.should_not be_valid
      end

    end

  end
  context 'Instance Methods' do
    describe '.ruby_gem_tokens' do
      before do
        5.times{ |n|Factory(:ruby_gem) }
      end
      context 'With a populated array' do
        before do
          @ids = []
          RubyGem.limit(5).each { |ruby_gem| @ids << ruby_gem.id }
        end
        it 'Returns a CSV string' do
          @tutorial.ruby_gem_tokens=@ids.join(',')
          @tutorial.ruby_gem_ids.should eql([1,2,3,4,5])
        end
      end

      context 'With a blank array' do
        it 'Returns a CSV string' do
          @tutorial.ruby_gem_tokens=""
          @tutorial.ruby_gem_ids.should be_blank
        end
      end

    end
    describe '.formated_body' do
      before do
        @tutorial.update_attributes(:body => "h1. Title \n body \n\nh2. Sub Title Even more body")
      end

      it 'Converts h1 textile tags to h2' do
        @tutorial.formated_body.should_not include("h1.")
      end

      it 'Converts h2 textile tags to h3' do
        @tutorial.formated_body.should include("h2. Title")
        @tutorial.formated_body.should include("h3. Sub Title")
        @tutorial.formated_body.should_not include("h2. Sub Title")
      end
    end
  end
end
