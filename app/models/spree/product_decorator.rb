module Spree
	Product.class_eval do
		delegate_belongs_to :master, :base_price
		delegate_belongs_to :master, :base_price_currency
		delegate_belongs_to :master, :base_price_currency_converter
	end
end
