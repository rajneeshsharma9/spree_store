Spree::Product.class_eval do

  self.whitelisted_ransackable_attributes = %w[description name slug discontinue_on promotionable available_on]

end
