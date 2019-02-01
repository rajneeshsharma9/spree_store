module Spree
  class Promotion
    module Rules
      class OrderItemCount < Spree::PromotionRule

        CRITERIA_VALUES = %w(equal_to less_than_or_equal_to greater_than_or_equal_to)

        preference :quantity, :integer, default: 1
        preference :criteria, :string, default: CRITERIA_VALUES.first

        validates :preferred_criteria, inclusion: { in: CRITERIA_VALUES, message: "%{value} is not a valid criteria" }
        validates :preferred_quantity, presence: true
        validates :preferred_quantity, numericality: { greater_than_or_equal_to: 1 }, allow_nil: true

        def applicable?(promotable)
          promotable.is_a?(Spree::Order)
        end

        def eligible?(order, options = {})
          compare_entity_item_count(order)
        end

        def actionable?(line_item)
          compare_entity_item_count(line_item.order)
        end

        private def compare_entity_item_count(entity)
          if preferred_criteria == 'equal_to'
            entity.item_count == preferred_quantity
          elsif preferred_criteria == 'less_than_or_equal_to'
            entity.item_count <= preferred_quantity
          else
            entity.item_count >= preferred_quantity
          end
        end

      end
    end
  end
end
