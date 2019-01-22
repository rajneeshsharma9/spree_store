# This migration comes from spree_simple_sales (originally 20190103075446)
class AddSalePriceToSpreeVariants < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_variants, :sale_price, :decimal, precision: 8, scale: 2
  end
end
