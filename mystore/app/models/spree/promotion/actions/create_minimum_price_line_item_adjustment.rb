module Spree
  class Promotion
    module Actions
      class CreateMinimumPriceLineItemAdjustment < Spree::PromotionAction
        include Spree::AdjustmentSource

        def perform(options = {})
          order = options[:order]
          create_unique_adjustment(order, order)
        end

        def compute_amount(order)
          minimum_priced_line_item = order.line_items.reorder(:price).first
          minimum_priced_line_item.price * -1
        end

      end
    end
  end
end
