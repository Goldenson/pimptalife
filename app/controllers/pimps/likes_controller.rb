class Pimps::LikesController < ApplicationController

	before_action :authenticate_user!
	before_action :set_pimp

	def create
		@pimp.likes.where(user_id: current_user.id).first_or_create

		respond_to do |format|
			format.html { redirect_to @pimp }
			format.js
		end
	end

	def destroy
		@pimp.likes.where(user_id: current_user.id).destroy_all

		respond_to do |format|
			format.html { redirect_to @pimp }
			format.js
		end
	end

	private

		def set_pimp
			@pimp = Pimp.find(params[:pimp_id])
		end
end