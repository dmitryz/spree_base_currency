Deface::Override.new(virtual_path: 'spree/admin/products/_form',
	name: 'add_base_price_to_product_edit',
	insert_after: "[data-hook='admin_product_form_price']",
	text: "
		<div data-hook=\"admin_product_base_price\" class=\"alpha two columns\">
			<%= f.field_container :base_price do %>
				<%= f.label :base_price, raw(Spree.t(:base_price) + content_tag(:span, '*')) %>
				<%= f.text_field :base_price, value: number_to_currency(@product.base_price, unit: '') %>
				<%= f.error_message_on :base_price %>
			<% end %>
		</div>
		<div data-hook=\"admin_product_base_price_currency\" class=\"omega two columns\">
			<%= f.field_container :base_price_currency do %>
				<%= f.label :base_price_currency, Spree.t(:base_price_currency) %>
				<%= f.text_field :base_price_currency %>
				<%= f.error_message_on :base_price_currency %>
			<% end %>
		</div>
		<div data-hook=\"admin_product_base_price_currency_converter\">
			<%= f.field_container :base_price_currency_converter do %>
				<%= f.label :base_price_currency_converter, Spree.t(:base_price_currency_converter) %>
				<%= f.text_field :base_price_currency_converter %>
				<%= f.error_message_on :base_price_currency_converter %>
			<% end %>
		</div>
	")
Deface::Override.new(virtual_path: 'spree/admin/variants/_form',
	name: 'add_base_price_to_variants_edit',
	insert_after: "[data-hook='cost_price']",
	text: "
		<div class=\"field\" data-hook=\"base_price\">
			<%= f.label :base_price, Spree.t(:base_price) %>
			<%= f.text_field :base_price, value: number_to_currency(@variant.base_price, unit: ''), class: 'fullwidth' %>
		</div>
		<div class=\"field\" data-hook=\"base_price_currency\">
			<%= f.label :base_price_currency, Spree.t(:base_price_currency) %>
			<%= f.text_field :base_price_currency %>
		</div>
		<div class=\"field\" data-hook=\"base_price_currency_converter\">
			<%= f.label :base_price_currency_converter, Spree.t(:base_price_currency_converter) %>
			<%= f.text_field :base_price_currency_converter %>
		</div>

")
