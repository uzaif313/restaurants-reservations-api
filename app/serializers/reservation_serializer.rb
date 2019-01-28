class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :guest_count, :guest_name, :reservation_time, :table_name

  def guest_name
  	object.guest_name
  end

  def table_name
  	object.table_name
  end

  def reservation_time
  	object.reservation_time.strftime("%H:%M")
  end

end
