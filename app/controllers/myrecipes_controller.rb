class MyrecipesController < ApplicationController
	before_action :set_myrecipe, only: [:edit, :update, :show, :like]
	before_action :require_user, except: [:show, :index]
	before_action :require_same_user, only: [:edit, :update]

	def index
		@myrecipes = Myrecipe.paginate(page: params[:page], per_page: 4)
	end

	def show

	end

	def new
		@myrecipe = Myrecipe.new
	end

	def create
		@myrecipe = Myrecipe.new(myrecipe_params)
		@myrecipe.chef = current_user

		if @myrecipe.save
			flash[:success] = "Your recipe was created successfully!"
			redirect_to myrecipes_path
		else
			render :new
		end
	end

	def edit

	end

	def update
		if @myrecipe.update(myrecipe_params)
			flash[:success] = "Your recipe was updated successfully!"
			redirect_to myrecipe_path(@myrecipe)
		else
			render :edit
		end
	end

	def like
		like = Like.create(like: params[:like], chef: current_user, myrecipe: @myrecipe)
		if like.valid?
			flash[:success] = "Your selection was successful"
			redirect_to :back
		else
			flash[:danger] = "You can only like/dislike a recipe once"
			redirect_to :back
		end
	end

	private 

		def myrecipe_params
			params.require(:myrecipe).permit(:name, :summary, :description, :picture)
		end

		def set_myrecipe
			@myrecipe = Myrecipe.find(params[:id])
		end

		def require_same_user
			if current_user != @myrecipe.chef
				flash[:danger] = "You can only edit your own recipes"
				redirect_to myrecipes_path
			end
		end

end