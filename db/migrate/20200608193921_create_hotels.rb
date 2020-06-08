class CreateHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|

      t.string  :name
      t.string  :address
      t.integer :adult_price, default: 0
      t.integer :cild_price, default: 0
      t.text    :impression
      t.integer :parking, default: 0
      t.string  :official_site

      t.timestamps
    end
  end
end
