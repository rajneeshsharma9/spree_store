Spree::Stock::Estimator.class_eval do

  def calculate_shipping_rates(package, ui_filter)
    api_cost = nil
    shipping_methods(package, ui_filter).map do |shipping_method|
      if shipping_method.calculator.is_api_calculator?
        cost = (api_cost ||= shipping_method.calculator.compute(package))
      else
        cost = shipping_method.calculator.compute(package)
      end
      next unless cost
      shipping_method.shipping_rates.new(
        cost: gross_amount(cost, taxation_options_for(shipping_method)),
        tax_rate: first_tax_rate_for(shipping_method.tax_category)
      )
    end.compact
  end

end
