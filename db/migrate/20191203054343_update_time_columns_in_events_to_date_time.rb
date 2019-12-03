class UpdateTimeColumnsInEventsToDateTime < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :start
    add_column :events, :start, :datetime
    remove_column :events, :end
    add_column :events, :end, :datetime
  end
end
