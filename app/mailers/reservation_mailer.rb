class ReservationMailer < ApplicationMailer
	def new_reservation_for_guest(reservation_id)
			@data = mailer_data(reservation_id)
			if @data.present?
				mail(to: @data[:guest].email, subject: 'Yiii Your Reservation is createad!!')
			end
	end

	def new_reservation_for_restaurant(reservation_id)
		@data = mailer_data(reservation_id)
			if @data.present?
				mail(to: @data[:restaurant].email, subject: 'New Reservation is createad!!')
			end
	end

	private 
		def mailer_data(reservation_id)
  	  @data = {}	
	  	@data[:reservation] = Reservation.find_by(id:reservation_id)
			 if @data[:reservation].present?
			 	@data[:guest] = @data[:reservation].guest
			 	@data[:restaurant] = @data[:reservation].restaurant
			 	@data[:restaurant_table] = @data[:reservation].restaurant_table
			 	@data[:restaurant_shift] = @data[:reservation].restaurant_shift
			 end
		 @data
		end

end
