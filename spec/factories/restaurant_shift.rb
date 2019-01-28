FactoryBot.use_parent_strategy = false

FactoryBot.define do
	factory :restaurant_shift do
    association :restaurant, factory: :restaurant, strategy: :build
		shift_name { Faker::Name.name } 
		start_at   { Time.now - 4.hours } 
		end_at     { Time.now }
	end
end