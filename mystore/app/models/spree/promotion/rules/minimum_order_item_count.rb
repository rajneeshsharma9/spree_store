module Spree
  class Promotion
    module Rules
      class MinimumOrderItemCount < Spree::PromotionRule

        preference :quantity, :integer, default: 1

        validates :preferred_quantity, presence: true
        validates :preferred_quantity, numericality: { greater_than_or_equal_to: 1 }, allow_nil: true

        def applicable?(promotable)
          promotable.is_a?(Spree::Order)
        end

        def eligible?(order, options = {})
          order.item_count >= preferred_quantity
        end

        def actionable?(line_item)
          line_item.order.item_count >= preferred_quantity
        end

      end
    end
  end
end
