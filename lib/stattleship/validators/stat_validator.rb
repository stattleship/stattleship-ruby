module Stattleship
  module Validators
    class StatValidator < Stattleship::Validators::BaseValidator
      def validate
        if present?(value) && present?(stat_type)
          return
        end

        if blank?(value)
          raise ArgumentError.new('expected stat')
        end

        raise ArgumentError.new('expected stat and type')
      end

      private

      def stat_type
        params['type']
      end
    end
  end
end
