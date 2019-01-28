RSpec.describe "Reservation", type: :request do

	it "GET #index" do
		get "api/v1/reservations",:formate =>:json
		expect(response).to have_http_status(:success)
	end

end