class User < ActiveRecord::Base
  devise :omniauthable
  has_many :posts

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :nome, :de_onde, :nome_convite, :convidados, :password, :password_confirmation, :remember_me

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:email => data.email).first
      user
    else # Create a user with a stub password. 
      #logger.debug data.inspect
      User.create!(:email => data.email, :password => Devise.friendly_token[0,20], :nome => data.username) 
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"]
      end
    end
  end

  # def apply_omniauth(omniauth)
  #   self.email = omniauth['user_info']['email'] if email.blank?
  #   authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  # end
  # 
  # def password_required?
  #   (authentications.empty? || !password.blank?) && super
  # end
end
