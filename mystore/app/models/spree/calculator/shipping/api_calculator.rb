module Spree
  module Calculator::Shipping
    class ApiCalculator < ShippingCalculator

      def self.description
        'Send api request to calculate shipping price'
      end

      def compute_package(package)
        headers = { "api-token" => Spree::Config[:shipment_api_key] }
        response = HTTParty.get(Spree::Config[:shipment_api_url], headers: headers)
        response['price']
      end

      def is_api_calculator?
        true
      end

    end
  end
end
