class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :payment_status, :default => "Pending"
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
