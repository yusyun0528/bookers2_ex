class AddRatesToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :rate, :integer
  end
end
