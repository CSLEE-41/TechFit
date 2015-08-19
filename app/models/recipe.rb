class Recipe < ActiveRecord::Base
  belongs_to :user
  mount_uploader :food_pic, FoodPicUploader
end
