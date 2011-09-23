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
  scope :ordered, order('ID DESC')

  def ruby_gem_tokens=(ids)
    self.ruby_gem_ids = ids.split(",")
  end

  def formated_body
    self.body.gsub(/^h2\./,'h3.').gsub(/^h1\./,'h2.')
  end

  def markdown_body
    markdown self.formated_body
  end

  def self.search(params="")
    if params.present?
      joins(:ruby_gems).where("title LIKE ? OR ruby_gems.id IN (#{search_ruby_gems(params)})", "%#{params}%")
    else
      return ordered
    end
  end

  private

  def self.search_ruby_gems(ruby_gems)
    ruby_gems.split(" ").map{ |rg| RubyGem.find_by_name(rg).id rescue nil }.uniq.compact.join(',')
  end
end








