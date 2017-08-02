class ReviewsController < ApplicationController
	before_action :find_gym

	def new
		@review = Review.new
	end
	# have view file ans create doesn't

	def create	
		@review = Review.new(review_params)
		@review.gym_id = @gym.id
		@review.user_id = current_user.id

		if @review.save
			redirect_to gym_path(@gym)
		else
			render 'new'
		end

    private

    def review_params
    	params.require(:review).permit(:rating, :comment)
    end

    def find_gym
    	@gym = Gym.find(params[:gym_id])
    end

end
