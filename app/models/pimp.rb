class Pimp < ActiveRecord::Base
	attachment :image
	belongs_to :user
	validates :image_id, presence: true
end