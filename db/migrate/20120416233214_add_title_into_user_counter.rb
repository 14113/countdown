class AddTitleIntoUserCounter < ActiveRecord::Migration
  def change
    add_column :user_counters, :title, :string
    add_index :user_counters, [:title,:user_id], {:unique=>true}
  end

end
