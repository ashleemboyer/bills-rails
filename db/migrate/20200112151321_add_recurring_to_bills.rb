class AddRecurringToBills < ActiveRecord::Migration[5.1]
  def change
    add_column :bills, :recurring, :boolean
  end
end
