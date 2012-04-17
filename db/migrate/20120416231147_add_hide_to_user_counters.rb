class AddHideToUserCounters < ActiveRecord::Migration
  def change
    add_column :user_counters, :hide, :bool, :default=>0
  end
end
