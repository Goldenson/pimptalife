class Pimp < ActiveRecord::Base
	attachment :image
	belongs_to :user
	validates :image, presence: true
	has_many :likes
end