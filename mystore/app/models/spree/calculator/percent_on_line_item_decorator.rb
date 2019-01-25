module Spree
  class Calculator
    PercentOnLineItem.class_eval do

      validates :percent, numericality: { greater_than: 0.0 }, on: :update

      def percent
        preferences[:percent]
      end

    end
  end
end
