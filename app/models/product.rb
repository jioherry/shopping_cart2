class Product < ApplicationRecord

	validates_presence_of :name, :price, :in_stock_qty

	has_many :cart_items, :dependent => :destroy
	has_many :carts, :through => :cart_items

	has_many :order_item, :dependent => :destroy
	has_many :orders, through: :order_items

end
