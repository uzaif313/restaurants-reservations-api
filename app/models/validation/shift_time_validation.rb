class Validation::ShiftTimeValidation < ActiveModel::Validator
  def validate(record)
    return if record.end_at.blank? || record.start_at.blank?
    if record.end_at.to_i < record.start_at.to_i
	     record.errors.add(:end_at, "Shift end time can’t be less than the start time") 
	  end
  end
end