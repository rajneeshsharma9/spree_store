module Spree
  Product.class_eval do
    delegate :sale_price, :sale_price=, :on_sale?, :orig_price_in, to: :master

  end
end
