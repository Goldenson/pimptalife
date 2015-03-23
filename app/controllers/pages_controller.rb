class PagesController < ApplicationController

	def index
		@pimps = Pimp.order("created_at desc").limit(9)
	end

end
