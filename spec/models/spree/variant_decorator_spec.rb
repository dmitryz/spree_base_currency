require 'spec_helper'

describe Spree::Variant do
	describe "#price_in" do
		before do
			@currency = create(:currency, base_currency: 'USD', local_currency: 'UAH', converter: 'mb', rate: 13.33)
		end

		it "returns the price convert from base currency to local currency" do
			variant = create(:variant, price: 100,
											 					 base_price: 8.00, 
											 					 base_price_currency: 'USD', 
																 base_price_currency_converter: 'mb')
			amount = Spree::Currency.convert(variant, 'UAH')
			expected = Spree::Price.new(:variant_id => variant.id, :currency => "UAH", :amount => amount)
			result = variant.price_in('UAH')

			result.variant_id.should == expected.variant_id
			result.amount.to_f.should == expected.amount.to_f
			result.currency.should == expected.currency
		end

		it "returns origin price if base_price is not set" do
			variant = create(:variant, price: 100, currency: 'UAH')
			expected = Spree::Price.new(:variant_id => variant.id, :currency => "UAH", :amount => variant.price)

      result = variant.price_in("UAH")

			Spree::Currency.can?(variant, 'UAH').should be_false
      result.variant_id.should == expected.variant_id
      result.amount.to_f.should == expected.amount.to_f
      result.currency.should == expected.currency
		end
	end
end
