module Spree
	Variant.class_eval do
		alias_method	:orig_price_in, :price_in
		def price_in(currency)
			return orig_price_in(currency) unless Spree::Currency.can?(self, currency)
			amount = Spree::Currency.convert(self, currency)
			Spree::Price.new(:variant_id => self.id, :amount => amount, :currency => currency)
		end

		def base_price=(price)
			puts "before Parse #{price}"
			self[:base_price] = parse_price(price) if price.present?
			puts "after Parse #{self.base_price}"
		end

	end
end
