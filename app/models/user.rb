class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :pimps, dependent: :destroy

  has_many :likes, dependent: :destroy

  def likes?(pimp)
  	# Return true or false
  	pimp.likes.where(user_id: id).any?
  end

  # Get avatar image from gravatar
  def avatar_url
  	hash = Digest::MD5.hexdigest(email)
  	"http://www.gravatar.com/avatar/#{hash}"
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name   # assuming the user model has a name
      user.name = "Your-name" if user.name.blank?
      user.email = auth.info.email
      user.email = "change-me@mail.com" if user.email.blank?
      user.password = Devise.friendly_token[0,20]
      #user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end