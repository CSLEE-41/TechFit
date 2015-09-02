class User < ActiveRecord::Base
  has_many :workouts, dependent: :destroy
  has_many :nutrition_plans, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :trackers, dependent: :destroy
  has_many :goal_lists, dependent: :destroy
  has_many :goals, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
end
