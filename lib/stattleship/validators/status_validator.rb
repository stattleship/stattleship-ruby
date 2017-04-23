module Stattleship
  module Validators
    class StatusValidator < Stattleship::Validators::BaseValidator
      VALID_STATUSES = %w(ended in_progress upcoming canceled closed complete created delayed fdelay halftime maintenance odelay postponed scheduled unnecessary wdelay).freeze

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
