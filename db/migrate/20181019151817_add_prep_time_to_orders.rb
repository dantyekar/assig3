class AddPrepTimeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :pickup_time, :integer, default: 0
  end
end
