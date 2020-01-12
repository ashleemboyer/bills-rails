class AddAccountReferenceToBills < ActiveRecord::Migration[5.1]
  def change
    add_reference :bills, :account
  end
end
