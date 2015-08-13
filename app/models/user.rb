class User < ActiveRecord::Base
  has_many :workouts, dependent: :destroy
  has_many :nutrition_plans, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end