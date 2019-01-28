class CreateRestaurantTables < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_tables do |t|
      t.references :restaurant, foreign_key: true
      t.string :table_name
      t.integer :min_guests
      t.integer :max_guests

      t.timestamps
    end
  end
end
