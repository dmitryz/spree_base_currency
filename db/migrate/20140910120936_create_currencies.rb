class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :spree_currencies do |t|
      t.string :base_currency
      t.string :local_currency
      t.string :converter
      t.decimal :rate, precision: 8, scale: 2

      t.timestamps
    end
  end
end
