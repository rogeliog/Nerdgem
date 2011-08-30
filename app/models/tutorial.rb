include TutorialsHelper
class Tutorial < ActiveRecord::Base
  attr_accessible :title, :body, :user_id, :ruby_gem_tokens

  acts_as_markdown :body
  # belongs_to :user
  has_and_belongs_to_many :ruby_gems
  attr_reader :ruby_gem_tokens

  # validates :user_id, :presence => true
  validates :title, :presence => true
  validates :body, :presence => true

  def ruby_gem_tokens=(ids)
    self.ruby_gem_ids = ids.split(",")
  end

  def formated_body
    self.body.gsub(/^h2\./,'h3.').gsub(/^h1\./,'h2.')
  end
  def markdown_body
    markdown self.formated_body
  end

end








