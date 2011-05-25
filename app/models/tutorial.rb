class Tutorial < ActiveRecord::Base
  attr_accessible :title, :body, :user_id
  
  belongs_to :user
  has_and_belongs_to_many :ruby_gems

  validates :user_id, :presence => true
  validates :title, :presence => true, :uniqueness => true
  validates :body, :presence => true
  

  def formated_body
    self.body.gsub(/^h2\./,'h3.').gsub(/^h1\./,'h2.')
  end

end







