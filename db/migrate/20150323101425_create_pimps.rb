class CreatePimps < ActiveRecord::Migration
  def change
    create_table :pimps do |t|
      t.integer :user_id
      t.string :name
      t.string :image_id

      t.timestamps null: false
    end
  end
end
