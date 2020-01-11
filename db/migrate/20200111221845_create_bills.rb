class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.string :name
      t.text :notes
      t.string :url
      t.integer :due_amount
      t.datetime :due_date
      t.datetime :paid_date
      t.integer :paid_amount

      t.timestamps
    end
  end
end
