Spree::Order.class_eval do

  def confirmation_required?
    false
  end

  remove_checkout_step :confirm

end
