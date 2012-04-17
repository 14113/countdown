class AddTitleIntoCounter < ActiveRecord::Migration
  def change
    add_column :counters, :title, :string
    add_index :counters, :title, {:unique=>true}
  end

end
