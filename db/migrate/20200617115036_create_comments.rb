class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|

      t.integer :user_id
      t.integer :travel_id
      t.text    :travel_comment

      t.timestamps
    end
  end
end