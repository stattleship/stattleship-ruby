module Stattleship
  module Validators
    class UpperSpeedValidator < Stattleship::Validators::BaseValidator
      def validate
        validates_positive_integer
      end
    end
  end
end
