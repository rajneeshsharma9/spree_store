Spree::Variant.class_eval do

  alias_method :orig_price_in, :price_in
  attr_accessor :price_diff

  validates :sale_price, numericality: { less_than: :price }, allow_nil: true

  after_save :update_incomplete_orders, if: :saved_change_to_sale_price?

  def price_in(currency)
    return orig_price_in(currency) unless sale_price.present?
    Spree::Price.new(variant_id: self.id, amount: self.sale_price, currency: currency)
  end

  def update_incomplete_orders
    orders.incomplete.each do |order|
      order.update_line_item_prices!
      order.update_with_updater!
    end
  end

  def on_sale?
    sale_price.present?
  end

end
