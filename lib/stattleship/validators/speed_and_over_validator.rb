module Stattleship
  module Validators
    class SpeedAndOverValidator < Stattleship::Validators::BaseValidator
      def validate
        validates_positive_integer
      end
    end
  end
end
