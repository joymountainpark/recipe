class MyrecipesController < ApplicationController

	def index
		@myrecipes = Myrecipe.all
	end

end