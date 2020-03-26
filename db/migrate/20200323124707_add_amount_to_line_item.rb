class AddAmountToLineItem < ActiveRecord::Migration[5.2]
  def change
  	add_column :line_items, :amount, :decimal
  	add_index :line_items, :amount
  end
end
