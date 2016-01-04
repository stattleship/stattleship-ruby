module Stattleship
  module Validators
    class LevelValidator < Stattleship::Validators::BaseValidator
      VALID_LEVELS = %w(typical common often rare record_tying record).freeze

      def validate
        if VALID_LEVELS.include?(value)
          return
        else
          fail ArgumentError.
            new("expected #{key} to be either #{VALID_LEVELS.join(', ')}")
        end
      end
    end
  end
end
