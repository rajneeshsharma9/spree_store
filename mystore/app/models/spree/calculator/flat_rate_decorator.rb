module Spree
  class Calculator
    FlatRate.class_eval do

      validates :amount, numericality: { greater_than: 0.0 }, on: :update

      def amount
        preferences[:amount]
      end

    end
  end
end
