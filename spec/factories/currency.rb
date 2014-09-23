FactoryGirl.define do
	factory :currency, class: Spree::Currency do
		base_currency 'USD'
		local_currency 'UAH'
		converter 'mb'
		rate 13.33	
	end
end
