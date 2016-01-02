module Stattleship
  module Validators
    class GameIdValidator < Stattleship::Validators::BaseValidator
      def validate
        validates_sports_prefix
      end
    end
  end
end
