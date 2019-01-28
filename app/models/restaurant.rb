class Restaurant < ApplicationRecord
	has_many :restaurant_shifts
	has_many :restaurant_tables

	validates :name, :email, :phone, presence: true
	validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }
	validates :phone, :length => { :minimum => 10, :maximum => 15 }

end
