require 'rails_helper'

RSpec.describe Restaurant, type: :model do

   let(:restaurant) { build(:restaurant)}

   it "should require a name" do
  	restaurant.name = nil
  	expect(restaurant).not_to be_valid
   end

   it "should require a email" do
    restaurant.email = nil
  	expect(restaurant).not_to be_valid
   end

   it "should require a phone" do
    restaurant.phone = nil
	 	expect(restaurant).not_to be_valid
   end

   it "should validate email" do
    restaurant.email = 'service@ahmedabadirestaurant'
 	 	expect(restaurant).not_to be_valid
   end

   it "should validate phone" do
    restaurant.phone = "0123456"
    expect(restaurant).not_to be_valid
   end

end
