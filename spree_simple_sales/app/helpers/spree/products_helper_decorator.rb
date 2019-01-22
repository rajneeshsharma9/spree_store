Spree::ProductsHelper.module_eval do

  def variant_full_price(variant)
    product = variant.product
    unless product.variants.active(current_currency).all? { |v| v.price == product.price && v.sale_price == product.price }
      Spree::Money.new(variant.sale_price || variant.price, currency: current_currency).to_html
    end
  end

end
