module Stattleship
  module Validators
    class GameIdValidator < Stattleship::Validators::BaseValidator
      def validate
        validates_league_prefix
      end
    end
  end
end
