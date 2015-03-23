class Pimp < ActiveRecord::Base
	attachment :image
	belongs_to :user

end