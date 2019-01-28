require 'rails_helper'

RSpec.describe RestaurantShift, type: :model do

	let(:restaurant_shift) { build(:restaurant_shift) }
	

	it "should require a name" do
  	restaurant_shift.shift_name = nil
  	expect(restaurant_shift).not_to be_valid
	end


  it "should require a start at" do
  	restaurant_shift.start_at = nil
  	expect(restaurant_shift).not_to be_valid
	end

	it "should require a end at" do
		restaurant_shift.end_at = nil
  	expect(restaurant_shift).not_to be_valid
	end

	it "should end time greater than start time" do
		restaurant_shift.end_at = Time.now-6.hours
  	expect(restaurant_shift).not_to be_valid
	end

end
