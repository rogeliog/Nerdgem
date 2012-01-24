require 'spec_helper'

describe User do
  let(:user){Factory(:user)}
  context 'Instance Methods' do
    describe '.points' do

      context 'With tutorials' do
        before do
          tutorial = Factory(:tutorial, user: user)
          tutorial_2 = Factory(:tutorial, user: user)
          2.times{Factory(:point, tutorial: tutorial)}
          3.times{Factory(:point, tutorial: tutorial_2)}
        end

        it 'Returns a sum with all the tutorial points' do
          user.points.should == 5
        end
      end

      context 'Without tutorials' do
        it 'Returns 0' do
          user.tutorials = []
          user.points.should == 0
        end
      end

    end
  end
end
