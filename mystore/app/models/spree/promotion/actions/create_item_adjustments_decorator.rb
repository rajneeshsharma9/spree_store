module Spree
  class Promotion
    module Actions
      CreateItemAdjustments.class_eval do

        preference :compare_with_sale_price, :boolen, default: false

        def compute_amount(line_item)
          return 0 unless promotion.line_item_actionable?(line_item.order, line_item)
          if compare_with_sale_price? && sale_price_better_deal?(line_item)
            return 0
          else
            default_discount(line_item)
          end
        end

        private def default_discount(line_item)
          [line_item.amount, compute(line_item)].min * -1
        end

        private def compare_with_sale_price?
          get_preference(:compare_with_sale_price) == '1'
        end

        private def sale_price_better_deal?(line_item)
          line_item.variant.price - compute(line_item) > line_item.amount
        end

      end
    end
  end
end
