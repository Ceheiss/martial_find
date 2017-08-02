class Gym < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :reviews

  has_attached_file :gym_img, :styles => { :gym_index => "250x350>", :gym_show => "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :gym_img, :content_type => /\Aimage\/.*\z/
end
