module Stattleship
  module Validators
    class BirthDateValidator < Stattleship::Validators::BaseValidator
      def validate
        Date.parse(value)
      end
    end
  end
end
