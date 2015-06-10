class AddPriceToLineItems < ActiveRecord::Migration
  def up
    add_column :line_items, :price, :decimal
    LineItem.all.each do |item|
    	item.update_attributes :price => item.product.price
	end	
  end
  def down
    remove_column :line_items, :price
  end
end
