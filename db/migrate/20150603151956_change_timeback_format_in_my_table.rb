class ChangeTimebackFormatInMyTable < ActiveRecord::Migration
  def change
     change_column :searches, :departure_time, :datetime
    change_column :searches, :departure_return_time, :datetime
  end
end
