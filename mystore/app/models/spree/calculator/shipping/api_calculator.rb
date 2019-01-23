module Spree
  module Calculator::Shipping
    class ApiCalculator < ShippingCalculator

      def self.description
        'Send api request to calculate shipping price'
      end

      def compute_package(package)
        headers = { "api-token" => "iw-kVcmVYRXg_Ps6UcwmdA" }
        response = HTTParty.get("http://localhost:1234/api/deals/shipping_amount", headers: headers)
        response['price']
      end

    end
  end
end
