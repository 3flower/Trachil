class CreateTravels < ActiveRecord::Migration[5.2]
  def change
    create_table :travels do |t|

      t.integer :user_id
      t.integer :play_id
      t.integer :hotel_id
      t.integer :meal_id
      t.integer :category_id
      t.string  :title
      t.date    :travel_day
      t.integer :traffic_way
      t.string  :recommend_age
      t.integer :evaluation
      t.boolean :is_display,    default: true

      t.timestamps
    end
  end
end
