class RubyGemTutorial < ActiveRecord::Base
  belongs_to :ruby_gem
  belongs_to :tutorial
end
