

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
end
