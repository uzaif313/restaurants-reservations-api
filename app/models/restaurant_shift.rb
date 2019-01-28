class RestaurantShift < ApplicationRecord
  belongs_to :restaurant
  has_many   :resrvations

  validates :shift_name, :start_at, :end_at, :presence => true
  validates_with Validation::ShiftTimeValidation


  def start_time
  	start_at.change({day:Time.now.day,month:Time.now.month,year:Time.now.year})
  end

  def end_time
  	end_at.change({day:Time.now.day,month:Time.now.month,year:Time.now.year})
  end
end
