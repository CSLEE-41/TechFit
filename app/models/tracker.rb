class Tracker < ActiveRecord::Base
  belongs_to :user

  before_create do 
    self.day_points = 0
    points = %w(health weight workout nutrition goals)

    points.each { |type| self.day_points +=1 if self.send(type)}

    self.overall_points = set_overall_points
  end

  def set_overall_points
    new_value = user.trackers.where("id IS NOT NULL").last.try(:overall_points) || 0
    new_value += day_points
  end
end
