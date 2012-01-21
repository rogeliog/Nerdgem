class Point < ActiveRecord::Base
  belongs_to :user
  belongs_to :tutorial, :counter_cache => true

  validates :user_id, :tutorial_id, presence: true
  validate :not_double

private
  def not_double
    unless Point.find_by_user_id_and_tutorial_id(self.user_id, self.tutorial_id).blank?
      self.errors.add('Point', 'is already created')
    end
  end
end
