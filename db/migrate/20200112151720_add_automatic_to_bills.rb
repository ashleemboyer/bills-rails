class AddAutomaticToBills < ActiveRecord::Migration[5.1]
  def change
    add_column :bills, :automatic, :boolean
  end
end
