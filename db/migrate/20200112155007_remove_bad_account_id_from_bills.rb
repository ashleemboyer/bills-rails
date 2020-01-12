class RemoveBadAccountIdFromBills < ActiveRecord::Migration[5.1]
  def change
    remove_column :bills, :account_id
  end
end
