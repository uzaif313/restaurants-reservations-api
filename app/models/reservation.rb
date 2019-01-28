class Reservation < ApplicationRecord
  belongs_to :restaurant_table
  belongs_to :restaurant_shift
  belongs_to :guest
  validates :guest_count, presence: true
  validates_with Validation::GuestCountValidation
  validates_with Validation::ReservationTimeValidation
  delegate :start_time, :end_time,  to: :restaurant_shift
  delegate :max_guests, :min_guests , to: :restaurant_table

  def restaurant
  	restaurant_table.restaurant
  end

end
