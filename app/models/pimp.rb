class Pimp < ActiveRecord::Base
	attachment :image
	belongs_to :user
	validates :image, presence: true
end