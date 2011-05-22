class Tutorial < ActiveRecord::Base
  attr_accessible :title, :body, :user_id
  belongs_to :user
end
