module Spree

  class UserActivityLog < Spree::Base

    serialize :flash, :errors

    belongs_to :user, class_name: 'Spree::User'
    validates :user, :response_code, :ip_address, presence: true

  end

end
