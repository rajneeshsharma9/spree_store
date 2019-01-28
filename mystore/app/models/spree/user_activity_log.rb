module Spree

  class UserActivityLog < Spree::Base

    belongs_to :user, class_name: 'Spree::User'
    validates :user, :response_code, :ip_address, presence: true

  end

end
