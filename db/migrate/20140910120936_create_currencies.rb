class CreateCurrencies < ActiveRecord::Migration
  def up
		drop_table :spree_currencies if ActiveRecord::Base.connection.table_exists? :spree_currencies
    create_table :spree_currencies do |t|
      t.string :base_currency
      t.string :local_currency
      t.string :converter
      t.decimal :rate, precision: 8, scale: 2

      t.timestamps
    end
  end

	def down
		drop_table :spree_currencies
	end
end
