module Spree

  class UserActivityLog < Spree::Base

    serialize :flash, HashWithIndifferentAccess
    serialize :entity_errors, HashWithIndifferentAccess

    belongs_to :user, class_name: 'Spree::User'
    validates :user, :response_code, :ip_address, presence: true

    def successful_request?
      entity_errors.empty? && response_code.between?(100, 399)
    end

  end

end
