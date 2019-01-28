class CreateRestaurantShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_shifts do |t|
      t.references :restaurant, foreign_key: true
      t.string :shift_name
      t.time :start_at
      t.time :end_at

      t.timestamps
    end
  end
end
