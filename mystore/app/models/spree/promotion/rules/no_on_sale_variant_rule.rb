module Spree
  class Promotion
    module Rules
      class NoOnSaleVariantRule < Spree::PromotionRule
        def applicable?(promotable)
          promotable.is_a?(Spree::Order)
        end

        def eligible?(order, options = {})
          order.variants.none? { |variant| variant.on_sale? }
        end
      end
    end
  end
end
