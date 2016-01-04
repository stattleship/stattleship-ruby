module Stattleship
  module Validators
    class LevelUpValidator < Stattleship::Validators::BaseValidator
      def validate
        validates_positive_or_zero_integer
      end
    end
  end
end
