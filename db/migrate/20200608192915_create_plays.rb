class CreatePlays < ActiveRecord::Migration[5.2]
  def change
    create_table :plays do |t|

      t.integer :travel_id
      t.string  :name
      t.string  :address
      t.integer :adult_price,     default: 0
      t.integer :child_price,      default: 0
      t.text    :impression
      t.boolean :is_diaper_place, default: true
      t.integer :parking
      t.string  :official_site

      t.timestamps
    end
  end
end
