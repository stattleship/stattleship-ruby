module Stattleship
  module Validators
    class BirthDateValidator < Stattleship::Validators::BaseValidator
      def validate
        validates_date
      end
    end
  end
end
