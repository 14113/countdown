class AddTitleIntoUserCounter < ActiveRecord::Migration
  def change
    add_column :user_counters, :title, :string
  end

end
