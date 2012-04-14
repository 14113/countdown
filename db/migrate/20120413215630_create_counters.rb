class CreateCounters < ActiveRecord::Migration
  def change
    create_table :counters do |t|
      t.string :name
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
