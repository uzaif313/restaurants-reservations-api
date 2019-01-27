require 'rails_helper'

RSpec.describe Guest, type: :model do

	let(:guest) {  build(:guest) }
 
  it "should require a name" do
  	guest.name = nil
  	expect(guest).not_to be_valid
	end

	it "should require a email" do
  	guest.email = nil
  	expect(guest).not_to be_valid
	end

	it "should validate email" do
		guest.email = "john.doe@gmail"
		expect(guest).not_to be_valid
	end
	
end
