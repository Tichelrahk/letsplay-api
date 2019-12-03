class ChangeDestroyedToRemoved < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :destroyed, :new_column
  end
end
