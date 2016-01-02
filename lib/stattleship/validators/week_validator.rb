module Stattleship
  module Validators
    class WeekValidator < Stattleship::Validators::BaseValidator
      def validate
        validates_positive_integer
      end
    end
  end
end
