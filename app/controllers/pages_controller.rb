class PagesController < ApplicationController

	def index
		@pimps = Pimp.order("created_at desc")
	end

end
