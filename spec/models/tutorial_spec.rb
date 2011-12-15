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
      
      it  'Without an estimated time' do
        @tutorial.estimated_time = nil
        @tutorial.should_not be_valid
      end

      it 'With an estimated time that is not valid' do
        pending
        @tutorial.estimated_time = 'not_valid'
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
          @tutorial.ruby_gem_ids.should eql(@ids)
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

    describe '.search' do
      context 'With a search param' do
        before do
          @tutorial_1 = Factory(:tutorial, :title =>"Random title")
          @tutorial_2 = Factory(:tutorial, :title =>"Some other title")
        end
        it 'Returns the tutorials where name is like params' do
          Tutorial.search("Random title").should  include @tutorial_1
        end
        it 'Does not returns the tutorials where name is not like params' do
          Tutorial.search("Random title").should_not include @tutorial_2
        end

      end
      context 'Without a search param' do
        it 'Returns all the tutorials' do
          Tutorial.search.should == (Tutorial.all)
        end
      end
    end

    describe 'self.top_tutorials' do
      it 'Returns the top tutorials' do
        pending 'Need to get a good top tutorials query'
      end
    end
    describe '.related_tutorials' do
      context 'When the tutorial has ruby gems' do
        before do
          @ruby_gem_1 = Factory(:ruby_gem, :name => 'First')
          @ruby_gem_2 = Factory(:ruby_gem, :name => 'Second')
          @ruby_gem_3 = Factory(:ruby_gem, :name => 'Third')

          @tutorial.ruby_gems = [@ruby_gem_1, @ruby_gem_2]
          @tutorial_1 = Factory(:tutorial, :ruby_gems=> [@ruby_gem_1])
          @tutorial_2 = Factory(:tutorial, :ruby_gems=> [@ruby_gem_2])
          @tutorial_3 = Factory(:tutorial, :ruby_gems=> [@ruby_gem_3])
        end
        it 'Returns the tutorials that are related to those gems' do
          @tutorial.related_tutorials.should == ([@tutorial,@tutorial_1, @tutorial_2])
        end
        it 'Does not returns the tutorials that are not related to those gems' do
          @tutorial.related_tutorials.should_not include @tutorial_3
        end

      end
      context 'When the tutorial does not has ruby gems' do
        it 'Returns only it self' do
          @tutorial.related_tutorials.should == [@tutorial]
        end

      end


    end

    describe '.ruby_gem_ids' do
      before do
        @ruby_gem_1 = Factory(:ruby_gem, :name => 'First')
        @ruby_gem_2 = Factory(:ruby_gem, :name => 'Second')
        @tutorial.ruby_gems = [@ruby_gem_1, @ruby_gem_2]
      end

      it 'Returns an array with the related ruby gem names' do
        @tutorial.ruby_gems_ids.should eql([@ruby_gem_1.id,@ruby_gem_2.id])
      end

      it 'Does not returns the ruby gems that are not related' do
        @ruby_gem = Factory(:ruby_gem)
        @tutorial.ruby_gems_names.should_not include(@ruby_gem.id)
      end
    end

    describe '.ruby_gem_names' do
      before do
        @tutorial.ruby_gems = [Factory(:ruby_gem, :name => 'First'),
                               Factory(:ruby_gem, :name => 'Second'),
                               Factory(:ruby_gem, :name => 'Third')]
      end

      it 'Returns an array with the related ruby gem names' do
        @tutorial.ruby_gems_names.should eql(['First','Second','Third'])
      end

      it 'Does not returns the ruby gems that are not related' do
        @ruby_gem = Factory(:ruby_gem)
        @tutorial.ruby_gems_names.should_not include(@ruby_gem.name)
      end
    end
  end
end
