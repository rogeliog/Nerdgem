class RubyGemTutorial < ActiveRecord::Base
  belongs_to :ruby_gem, counter_cache: :tutorials_count
  belongs_to :tutorial
end
