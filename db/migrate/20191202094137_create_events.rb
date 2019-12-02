class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.date :date
      t.time :start
      t.time :end
      t.string :message
      t.string :name
      t.integer :price
      t.text :description
      t.references :user, foreign_key: true
      t.integer :slots
      t.boolean :completed
      t.references :location, foreign_key: true
      t.boolean :private
      t.boolean :prepayment
      t.boolean :selective
      t.string :status
      t.boolean :destroyed

      t.timestamps
    end
  end
end
