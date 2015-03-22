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

	def edit
		@myrecipe = Myrecipe.find(params[:id])
	end

	def update
		@myrecipe = Myrecipe.find(params[:id])
		if @myrecipe.update(myrecipe_params)
			#do something
			flash[:success] = "Your recipe was updated successfully!"
			redirect_to myrecipe_path(@myrecipe)
		else
			render :edit
		end
	end

	private 

		def myrecipe_params
			params.require(:myrecipe).permit(:name, :summary, :description)
		end

end