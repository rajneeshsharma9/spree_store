Spree::StoreCredit.class_eval do

  def expired?
    expires_at.present? && expires_at < Time.current
  end

  def amount_remaining
    expired? ? 0 : amount - amount_used - amount_authorized
  end

end
