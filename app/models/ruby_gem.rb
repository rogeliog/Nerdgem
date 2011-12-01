class RubyGem < ActiveRecord::Base
  has_and_belongs_to_many :tutorials
  serialize :info, Hash
  before_create :set_info


  def set_info
    self.info = {}
  end
  def self.top_ruby_gems size=5, offs=100
    limit(size).offset(offs)
  end

  def self.search(params="")
    params.present? ? where("name #{LIKE} ?", "%#{params}%") : scoped
  end

  def get_info
    if self.info.blank? or self.expired_info?
      self.info = JSON.load(RestClient.get "https://rubygems.org/api/v1/gems/#{self.name}.json") rescue {}
      self.save
    end
    self.info
  end

  def expired_info?
    (Time.now - 1.day) > self.updated_at
  end
end
