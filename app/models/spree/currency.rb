require 'money'
module Spree
	class Currency < ActiveRecord::Base
		def self.can?(variant, currency)
			variant.base_price.present? && self.get_converter(variant, currency).present?
		end

		def self.convert(variant, currency)
			converter = self.get_converter(variant, currency)
			amount = ::Money.new(variant.base_price * converter.rate)
			amount.round(2)
		end

		def self.currency_where_add(variant)
			if variant.base_price_currency_converter.present?
				{ converter: variant.base_price_currency_converter }
			else
				{}
			end
		end
		
		def self.get_converter(variant, currency)
			Spree::Currency.where(base_currency: variant.base_price_currency, 
													 local_currency: currency).
													 where(self.currency_where_add(variant)).first
		end
	end
end
