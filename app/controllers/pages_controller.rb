class PagesController < ApplicationController

	def home
		redirect_to myrecipes_path if logged_in?
	end

end