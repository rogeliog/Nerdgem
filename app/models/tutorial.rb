include TutorialsHelper
class Tutorial < ActiveRecord::Base
  attr_accessible :title, :body, :user_id, :ruby_gem_tokens, :estimated_time, :source_code, :repo_link

  acts_as_markdown :body

  # has_and_belongs_to_many :ruby_gems
  has_many :ruby_gem_tutorials, dependent: :destroy
  has_many :ruby_gems, through: :ruby_gem_tutorials
  
  belongs_to :user, counter_cache: true
  has_many :points, :dependent => :destroy
  attr_reader :ruby_gem_tokens

  mount_uploader :source_code, FileUploader

  ESTIMATED_TIMES = ['Less than 15 minutes','Between 30 and 60 minutes','More than 60 minutes']

  validates :user_id, :title, :body, :estimated_time, :presence => true

  scope :ordered, order('created_at DESC')

  #Class Methods
  
  def self.search(params="")
    params.present? ? where("title #{LIKE} ?", "%#{params}%") : scoped
  end

  def self.top_tutorials size=5
    limit(size).order('points_count DESC')
  end

  #Instance Methods
  
  def ruby_gem_tokens=(ids)
    self.ruby_gem_ids = ids.split(",")
  end

  def formated_body
    self.body.gsub(/^h2\./,'h3.').gsub(/^h1\./,'h2.')
  end

  def markdown_body
    markdown self.formated_body
  end

  def related_tutorials
    if ruby_gems_ids.present?
      ([self] + Tutorial.joins(:ruby_gems).where("ruby_gems.id IN (#{ruby_gems_ids.join(',')})")).uniq 
    else
      [self]
    end
  end

  def ruby_gems_ids
    self.ruby_gems.map(&:id)
  end
  def ruby_gems_names
    self.ruby_gems.map(&:name)
  end

  def add_point user
      point = Point.new(tutorial: self, user: user)
      point.save
  end

  private

  def self.search_ruby_gems(ruby_gems)
    puts ''
    ruby_gems.split(" ").map{ |rg| RubyGem.where("name #{LIKE} ?", "#{rg}").first.id rescue nil}.uniq.compact.join(',')
  end

end
