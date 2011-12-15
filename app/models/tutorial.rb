include TutorialsHelper
class Tutorial < ActiveRecord::Base
  attr_accessible :title, :body, :user_id, :ruby_gem_tokens, :estimated_time

  acts_as_markdown :body
  belongs_to :user
  has_and_belongs_to_many :ruby_gems
  attr_reader :ruby_gem_tokens

  ESTIMATED_TIMES = ['Less than 15 minutes','Between 30 and 60 minutes','More than 60 minutes']

  validates :user_id, :title, :body, :estimated_time, :presence => true
  # validates :estimated_time, :presence => true, :email_format => true

  scope :ordered, order('created_at DESC')

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
    params.present? ? where("title #{LIKE} ?", "%#{params}%") : scoped
  end

  def self.top_tutorials size=5
    limit(size)
  end

  def related_tutorials
    ([self] + Tutorial.joins(:ruby_gems).where("ruby_gems.id IN (#{ruby_gems_ids.join(',')})")).uniq
  end

  def ruby_gems_ids
    self.ruby_gems.map(&:id)
  end
  def ruby_gems_names
    self.ruby_gems.map(&:name)
  end

  private

  def self.search_ruby_gems(ruby_gems)
    puts ''
    ruby_gems.split(" ").map{ |rg| RubyGem.where("name #{LIKE} ?", "#{rg}").first.id rescue nil}.uniq.compact.join(',')
  end

end
