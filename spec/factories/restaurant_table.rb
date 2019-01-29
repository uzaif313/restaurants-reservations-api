FactoryBot.use_parent_strategy = false

FactoryBot.define do
	factory :restaurant_table do
    association :restaurant, factory: :restaurant#, strategy: :build
		table_name { Faker::Name.name } 
		min_guests { 5 }
		max_guests { 2 }
	end
end