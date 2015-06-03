class ChangeTimeFormatInMyTable < ActiveRecord::Migration
  def change
    change_column :searches, :departure_time, :time
    change_column :searches, :departure_return_time, :time
  end
end
