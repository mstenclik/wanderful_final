class CreateCarriers < ActiveRecord::Migration
  def change
    create_table :carriers do |t|
      t.string :code
      t.string :name
      t.string :url

      t.timestamps

    end
  end
end
