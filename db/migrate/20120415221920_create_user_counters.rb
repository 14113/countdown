class CreateUserCounters < ActiveRecord::Migration
  def change
    create_table :user_counters do |t|
      t.string :user_id
      t.references :counter

      t.timestamps
    end
    add_index :user_counters, :counter_id
    add_index :user_counters, :user_id
  end
end
