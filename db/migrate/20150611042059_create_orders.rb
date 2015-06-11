class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :address
      t.string :email
      t.string :pay_type

      t.timestamps null: false
    end
  end
end
