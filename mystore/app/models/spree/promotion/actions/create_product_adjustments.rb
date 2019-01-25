module Spree
  class Promotion
    module Actions
      class CreateProductAdjustments < PromotionAction
        include Spree::CalculatedAdjustments
        include Spree::AdjustmentSource

        has_many :promotion_action_products, foreign_key: :promotion_action_id
        has_many :products, through: :promotion_action_products

        before_validation -> { self.calculator ||= Calculator::PercentOnLineItem.new }

        def perform(options = {})
          order = options[:order]
          promotion = options[:promotion]
          eligible_line_items = order.line_items.joins(:product).where(spree_products: { id: product_ids })
          create_unique_adjustments(order, eligible_line_items) do |line_item|
            promotion.line_item_actionable?(order, line_item)
          end
        end

        def compute_amount(line_item)
          return 0 unless promotion.line_item_actionable?(line_item.order, line_item)
          [line_item.amount, compute(line_item)].min * -1
        end

        def product_ids_string
          product_ids.join(',')
        end

        def product_ids_string=(s)
          self.product_ids = s.to_s.split(',').map(&:strip)
        end

      end
    end
  end
end
