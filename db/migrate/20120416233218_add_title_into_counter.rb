class AddTitleIntoCounter < ActiveRecord::Migration
  def change
    add_column :counters, :title, :string
    add_index :counters, :title
  end

end
