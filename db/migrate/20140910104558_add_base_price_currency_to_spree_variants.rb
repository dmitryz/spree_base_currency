class AddBasePriceCurrencyToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :base_price_currency, :string
		add_column :spree_variants, :base_price_currency_converter, :string
  end
end
