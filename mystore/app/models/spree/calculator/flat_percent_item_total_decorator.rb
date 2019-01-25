module Spree
  class Calculator
    FlatPercentItemTotal.class_eval do

      validates :flat_percent, numericality: { greater_than: 0.0 }, on: :update

      def flat_percent
        preferences[:flat_percent]
      end

    end
  end
end
