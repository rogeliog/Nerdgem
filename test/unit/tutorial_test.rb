require 'test_helper'

class TutorialTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Tutorial.new.valid?
  end
end
