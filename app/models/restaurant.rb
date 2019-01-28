class Restaurant < ApplicationRecord
	has_many :restaurant_shifts
	has_many :restaurant_tables
	has_many   :resrvations
	
	validates :name, :email, :phone, presence: true
	validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }
	validates :phone, :numericality => true, :length => { :minimum => 10, :maximum => 15 }

end
