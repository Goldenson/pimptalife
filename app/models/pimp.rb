class Pimp < ActiveRecord::Base
	attachment :image
	belongs_to :user
	validates :image, presence: true
	has_many :likes, dependent: :destroy
	validates :name, presence: true
end