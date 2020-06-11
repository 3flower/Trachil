class CreateTravelImages < ActiveRecord::Migration[5.2]
  def change
    create_table :travel_images do |t|
      
      t.integer :travel_id
      t.string  :image_url
      t.timestamps
    end
  end
end
