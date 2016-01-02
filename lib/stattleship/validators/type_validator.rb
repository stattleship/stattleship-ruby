module Stattleship
  module Validators
    class TypeValidator < Stattleship::Validators::BaseValidator
      def validate
        validates_sport_prefix
      end
    end
  end
end
