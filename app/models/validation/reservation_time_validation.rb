class Validation::ReservationTimeValidation < ActiveModel::Validator
  def validate(record)
    unless record.reservation_time.to_i >= record.start_time.to_i  && record.reservation_time.to_i <= record.end_time.to_i
	     record.errors.add(:end_at, "Invalid time for selected shift") 
	  end
  end
end