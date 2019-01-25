module Spree
  class PromotionActionProduct < Spree::Base
    belongs_to :promotion_action, class_name: 'Spree::Promotion::Actions::CreateProductAdjustments'
    belongs_to :product, class_name: 'Spree::Product'

    validates :promotion_action, :product, presence: true
  end
end
