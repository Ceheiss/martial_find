class Review < ApplicationRecord
	belongs_to :gym
	belongs_to :user
	#a review cannot exist without a user and a gym to be reviewed (if not, what are they reviewing and who?)

end
