class MyrecipesController < ApplicationController

	def index
		@myrecipes = Myrecipe.all
	end

	def show
		@myrecipe = Myrecipe.find(params[:id])
	end

	def new
		@myrecipe = Myrecipe.new
	end

	def create
		@myrecipe = Myrecipe.new(myrecipe_params)
		@myrecipe.chef = Chef.find(2)

		if @myrecipe.save
			flash[:success] = "Your recipe was created successfully!"
			redirect_to myrecipes_path
		else
			render :new
		end
	end

	private 

		def myrecipe_params
			params.require(:myrecipe).permit(:name, :summary, :description)
		end

end