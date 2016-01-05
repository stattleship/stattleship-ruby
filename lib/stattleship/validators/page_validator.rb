module Stattleship
  module Validators
    class PageValidator < Stattleship::Validators::BaseValidator
      def validate
        validates_positive_integer
      end
    end
  end
end
