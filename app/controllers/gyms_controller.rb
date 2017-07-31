class GymsController < ApplicationController
	before_action :find_gym, only: [:show, :update, :edit, :destroy]


	def index
		@gyms = Gym.all.order("created_at DESC") #DESC is descending orden
	end

	def show
	end

	def new
		@gym = Gym.new
	end

	def create
		@gym = Gym.new(gym_params)

		if @gym.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	private

	def gym_params
		params.require(:gym).permit(:name, :description, :address)
	end

	def find_gym
		@gym = Gym.find(params[:id])
	end


end
