include TutorialsHelper
class Tutorial < ActiveRecord::Base
  attr_accessible :title, :body, :user_id, :ruby_gem_tokens

  acts_as_markdown :body
  belongs_to :user
  has_and_belongs_to_many :ruby_gems
  attr_reader :ruby_gem_tokens

  validates :user_id, :presence => true
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
    params.present? ? where("title LIKE ?", "%#{params}%") : scoped
    #   list = search_ruby_gems(params)
    #   where_clause = %{
    #   tutorials.id IN
    #   (SELECT v.tutorial_id FROM 
    #   (SELECT tutorial_id, count(*) as cnt FROM ruby_gems_tutorials WHERE ruby_gem_id in (#{list}) GROUP BY tutorial_id) v 
    #   WHERE v.cnt = #{list.split(",").size})
    #   } 
    #   # results = params.split(" ").map{ |str| "title LIKE '%#{str}%'"}.compact.join(" OR ")
    #   # joins(:ruby_gems).where("title LIKE ? OR #{where_clause} OR #{results} ","%#{params}%")

    #   joins(:ruby_gems).where("title LIKE ? OR #{where_clause}","%#{params}%").uniq
    # else
    #   return ordered
    # end
  end

  def related_tutorials
    if self.ruby_gems.blank?
    Tutorial.search(self.title).uniq
    else
    Tutorial.search(self.title) + Tutorial.search(self.ruby_gems_names.join(' ')).uniq
    end
  end

  def ruby_gems_names
    self.ruby_gems.map(&:name)
  end

  private

  def self.search_ruby_gems(ruby_gems)
    ruby_gems.split(" ").map{ |rg| RubyGem.where("name LIKE ?", "#{rg}").first.id rescue nil}.uniq.compact.join(',')
  end
end
