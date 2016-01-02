module Stattleship
  module Validators
    class StatusValidator < Stattleship::Validators::BaseValidator
      VALID_STATUSES = %w(ended in_progress upcoming).freeze

      def validate
        if VALID_STATUSES.include?(value)
          return
        else
          fail ArgumentError.
            new("expected #{key} to be either #{VALID_STATUSES.join(', ')}")
        end
      end
    end
  end
end
