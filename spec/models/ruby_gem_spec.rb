require 'spec_helper'

describe RubyGem do
  let(:ruby_gem){Factory(:ruby_gem, :info => {:info => "Ruby Gem"})}
  describe 'Instance Methods' do

    describe '.get_info' do
      before do
        RestClient.stub(:get).and_return(%q{{"info":"New info"}})
      end

      it 'Get the ruby gem info' do
        ruby_gem.get_info.should eql(ruby_gem.info)
      end

      context 'When the info has expired' do
        before do
          RubyGem.any_instance.stub(:expired_info?).and_return(true)
        end
        it 'Gets the new info' do
          ruby_gem.get_info.should eql({"info"=>"New info"})
        end
      end
     
      describe 'When there is no info' do
        before do
          RubyGem.any_instance.stub(:expired_info?).and_return(false)
          ruby_gem.update_attributes({:info => {}})
        end
        it 'Get new ruby info' do
          ruby_gem.get_info.should eql({"info"=>"New info"})
        end

      end
    end

    describe '.expired_info?' do
      context 'When it was updated at before a day ago' do
        before do
          Timecop.freeze(ruby_gem.updated_at)
        end
        it 'Returns false' do
          ruby_gem.expired_info?.should be_false
        end
      end
      context 'When it was updated at least a day ago' do
        before do
          Timecop.return
          Timecop.freeze(Time.now + 1.day + 1.hour)
        end
        it 'Returns true' do
          ruby_gem.expired_info?.should be_true
        end
      end

    end
  end
end
