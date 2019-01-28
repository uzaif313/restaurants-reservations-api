class Validation::GuestCountValidation < ActiveModel::Validator
  def validate(record)
    return false unless record.guest_count.present?
		unless record.guest_count >= record.min_guests && record.guest_count <= record.max_guests
			 record.errors.add(:guest_count, 'Must be between restaurant table max and min guests count')
		end
  end
end