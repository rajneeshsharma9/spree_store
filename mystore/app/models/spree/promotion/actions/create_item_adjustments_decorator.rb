module Spree
  class Promotion
    module Actions
      CreateItemAdjustments.class_eval do

        preference :compare_with_sale_price, :boolen, default: false

        def compute_amount(line_item)
          return 0 unless promotion.line_item_actionable?(line_item.order, line_item)
          if line_item.variant.on_sale? && get_preference(:compare_with_sale_price) == '0'
            return 0
          end
          if get_preference(:compare_with_sale_price) == '1' && line_item.variant.price - compute(line_item) > line_item.amount
            return 0
          end
          [line_item.amount, compute(line_item)].min * -1
        end

      end
    end
  end
end
