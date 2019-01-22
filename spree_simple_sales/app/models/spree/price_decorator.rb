Spree::Price.class_eval do

  after_save :update_incomplete_orders, if: :saved_change_to_amount?

  def price_including_vat_for(price_options)
    options = price_options.merge(tax_category: variant.tax_category)
    if variant.sale_price.present?
      gross_amount(variant.sale_price, options)
    else
      gross_amount(price, options)
    end
  end

  private def update_incomplete_orders
    variant.update_incomplete_orders
  end

end
