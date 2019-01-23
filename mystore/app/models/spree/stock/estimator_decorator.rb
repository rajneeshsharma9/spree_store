Spree::Stock::Estimator.class_eval do

  def calculate_shipping_rates(package, ui_filter)
    api_cost = nil
    shipping_methods(package, ui_filter).map do |shipping_method|
      if is_api_calculator?(shipping_method.calculator)
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

  private def is_api_calculator?(calculator)
    calculator.class.name.split('::').last == "ApiCalculator"
  end

end
