class Goal < ActiveRecord::Base
  belongs_to :user
  belongs_to :goal_list
end
