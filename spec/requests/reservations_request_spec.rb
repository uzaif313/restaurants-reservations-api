require "rails_helper"

RSpec.describe "Reservation", :type => :request do

	it "GET #index" do
		get api_v1_restaurant_reservations_path(1)
		expect(response).to have_http_status(:success)
	end

	# it "POST #create" do
	# 	create(:restaurant)
	# 	create(:restaurant_shift)
	# 	create(:restaurant_table)
	# 	create(:guest)
	# 	form_data = {
	# 		reservations:{
	# 			restaurant_shift_id:1,
	# 			restaurant_table_id:1,
	# 			guest_id:1,
	# 			guest_count:4,
	# 			reservation_time: Time.now
	# 		}
	# 	}
	# 	post api_v1_reservations_path, params: form_data
	# 	expect(response).to have_http_status(:success)
	# end

end