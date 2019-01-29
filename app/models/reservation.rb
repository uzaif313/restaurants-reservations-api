class Reservation < ApplicationRecord
  include Swagger::Blocks
  belongs_to :restaurant_table
  belongs_to :restaurant_shift
  belongs_to :guest
  validates :guest_count, presence: true
  validates_with Validation::GuestCountValidation
  validates_with Validation::ReservationTimeValidation
  delegate :start_time, :end_time,  to: :restaurant_shift
  delegate :max_guests, :min_guests , to: :restaurant_table
  include AuditLogable
 
 
  swagger_schema :ReservationInput do
    key :required, [:name, :email]
      property :name do
        key :type, :string
      end
      property :email do
        key :type, :string
      end
    end
  end
  def restaurant
  	restaurant_table.restaurant
  end

end
