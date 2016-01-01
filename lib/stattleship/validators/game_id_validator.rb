module Stattleship
  module Validators
    class GameIdValidator < Stattleship::Validators::BaseValidator
      def validate
        if blank?(value)
          return
        else
          if value.start_with?("#{sport_prefix}-")
            return
          end
        end

        raise ArgumentError.
          new("Invalid #{key} '#{value}'. Must start with '#{sport_prefix}'.")
      end
    end
  end
end
