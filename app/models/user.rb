class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :pimps, dependent: :destroy

  has_many :likes

  def likes?(pimp)
  	# Return true or false
  	pimp.likes.where(user_id: id).any?
  end

  # Get avatar image from gravatar
  def avatar_url
  	hash = Digest::MD5.hexdigest(email)
  	"http://www.gravatar.com/avatar/#{hash}"
  end

end
