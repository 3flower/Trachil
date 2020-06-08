class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|

      t.string  :shop_name
      t.string  :address
      t.integer :adult_price, default: 0
      t.integer :cild_price, default: 0
      t.text    :impression
      t.boolean :is_baby_food_place, default: true
      t.integer :parking, default: 0
      t.string  :official_site

      t.timestamps
    end
  end
end
