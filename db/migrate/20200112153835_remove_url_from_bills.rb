class RemoveUrlFromBills < ActiveRecord::Migration[5.1]
  def change
    remove_column :bills, :url
  end
end
