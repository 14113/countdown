class AddUserIdToCounters < ActiveRecord::Migration
  def change
    add_column :counters,:user_id, :string
    add_index :counters,:user_id
  end
end
