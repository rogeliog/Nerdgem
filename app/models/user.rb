class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:name
  has_many :tutorials, :dependent => :destroy
  has_many :authentications, :dependent => :destroy

  def self.search(params="")
    params.present? ? where("name LIKE ?", "%#{params}%") : scoped
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
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'].to_s)
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

end
