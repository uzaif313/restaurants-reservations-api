class Api::V1::ReservationsController < Api::V1::ApplicationController
  include Swagger::Blocks
  include Swagger::ReservationApi


  def index
  	data = Reservation.joins(:restaurant_shift).where("restaurant_shifts.restaurant_id = ?",params[:restaurant_id])
		render_json("List of reservation",true,serailie_json(data),200)
	end

	def create
		reservation = Reservation.new(reservation_params)
		if reservation.save!
			send_email(reservation.id)
			render_json("Successfully reservation created",true,reservation,200)
		else
			render_json("Something Goes Wrong",false,reservation.errors,501)
		end
	end

	def show
		render_json("Reservation", true, serailie_json(Reservation.first), 200)
	end

	def update
    reservation = Reservation.find(params[:id])
		if reservation.update(reservation_params)
			send_email_on_update(reservation.id)
			render_json("Successfully reservation updated",true,reservation,200)
		else
			render_json("Something Goes Wrong",false,reservation.errors,501)
		end
	end

	private

		def reservation_params
			params.require(:reservations).permit(:restaurant_shift_id,
																					 :restaurant_table_id,
																					 :reservation_time,
																					 :guest_id, :guest_count)
		end

		def send_email(reservation_id)
			ReservationMailer.new_reservation_for_guest(reservation_id).deliver_now
			ReservationMailer.new_reservation_for_restaurant(reservation_id).deliver_now
		end

    def send_email_on_update(reservation_id)
      ReservationMailer.update_reservation_for_guest(reservation_id).deliver_now
      ReservationMailer.update_reservation_for_restaurant(reservation_id).deliver_now
    end

end
