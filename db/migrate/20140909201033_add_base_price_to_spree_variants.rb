class AddBasePriceToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :base_price, :decimal, precision: 8, scale: 2
  end
end
