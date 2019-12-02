class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :bio
      t.string :open_id
      t.string :wechat_id
      t.string :location
      t.string :profile_picture

      t.timestamps
    end
  end
end
