class CreateTravelImages < ActiveRecord::Migration[5.2]
  def change
    create_table :travel_images do |t|

      t.timestamps
    end
  end
end
