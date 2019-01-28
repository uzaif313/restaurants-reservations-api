class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :guest_count, :guest_name, :reservation_time

  def guest_name
  	object.guest.name
  end

end
