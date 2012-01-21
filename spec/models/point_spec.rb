require 'spec_helper'

describe Point do
  let(:point){Factory(:point)}
  describe 'Validations' do
    context 'Point is valid' do
      it 'With all attributes' do
        point.should be_valid
      end
    end
    
    context 'Point is not valid' do
      it 'Without a tutorial' do
        point.tutorial_id = nil
        point.should_not be_valid
      end

      it 'Without a user' do
        point.user_id = nil
        point.should_not be_valid
      end
    end
  end

end

