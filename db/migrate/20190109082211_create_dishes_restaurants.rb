class CreateDishesRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes_restaurants do |t|
      t.integer :dish_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
