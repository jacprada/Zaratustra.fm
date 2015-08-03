class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :name
      t.text :bio
      t.text :profile_image
      t.text :background_image

      t.timestamps null: false
    end
  end
end
