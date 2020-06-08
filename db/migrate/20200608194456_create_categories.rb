class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|

      t.boolean :is_play,  default: false
      t.boolean :is_hotel, default: false
      t.boolean :is_meal,  default: false

      t.timestamps
    end
  end
end
