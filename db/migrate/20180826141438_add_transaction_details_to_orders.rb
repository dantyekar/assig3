class AddTransactionDetailsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :txn_id, :string
    add_column :orders, :invoice, :string
  end
end
