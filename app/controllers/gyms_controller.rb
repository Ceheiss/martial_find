class GymsController < ApplicationController
	before_action :find_gym, only: [:show, :update, :edit, :destroy]


	def index
		@gyms = Gym.all.order("created_at DESC") #DESC is descending orden
	end

    def category
      @gyms = Gym.where(category_id: params[:id]) 
    end

	def show
	end

	def new
		@gym = current_user.gyms.build
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def create
		@gym = current_user.gyms.build(gym_params)
		@gym.category_id = params[:category_id]

		if @gym.save
			redirect_to root_path
		else
			render 'new'
		end
	end


	def edit
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def update
		@gym.category_id = params[:category_id]

		if @gym.update(gym_params)
			redirect_to gym_path(@gym)
		else
			render 'edit'
		end

	end

	def destroy
		@gym.destroy
		redirect_to root_path
	end

	# edit and update won't have a view files, they are responsable for changes in the data base.

	private

	def gym_params
		params.require(:gym).permit(:name, :description, :address, :category_id)
	end

	def find_gym
		@gym = Gym.find(params[:id])
	end


end
