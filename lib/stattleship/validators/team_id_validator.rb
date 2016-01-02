module Stattleship
  module Validators
    class TeamIdValidator < Stattleship::Validators::BaseValidator
      def validate
        validates_sports_prefix
      end
    end
  end
end
