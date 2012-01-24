class User < ActiveRecord::Base
  include ActionView::Helpers::TextHelper
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:name
  has_many :tutorials, :dependent => :destroy
  has_many :authentications, :dependent => :destroy
  has_many :points, :dependent => :destroy
  has_many :given_points,
            class_name:'Point', 
            foreign_key: :user_id, 
            dependent: :destroy


  def self.search(params="")
    params.present? ? where("name #{LIKE} ?", "%#{params}%") : scoped
  end

  def pretty_name
    truncate(name.presence || email, length: 25 )
  end

  def admin?
    self.role == 'admin'
  end

  def member?
    self.role == 'member'
  end

  def self.top_users size=5
    limit(size)
  end

  def apply_omniauth(omniauth)
    self.email = omniauth['user_info']['email'] if email.blank?
    self.name = omniauth['user_info']['name'] if name.blank?
    self.image = omniauth['extra']['user_hash']['avatar_url'] rescue ''
    self.github_profile = omniauth['user_info']['urls']['GitHub'] rescue ''
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'].to_s)
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
  
  def points
    tutorials.present? ? tutorials.map(&:points_count).inject{|sum,x| sum + x } : 0
  end

  def added_point? tutorial
    Point.find_by_user_id_and_tutorial_id(self.id, tutorial.id).present?
  end

end
