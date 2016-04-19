module Stattleship
  module Params
    class QueryParams
      attr_accessor :page, :per_page, :season_id

      def params
        {
          'page' => page,
          'per_page' => per_page,
          'season_id' => season_id,
        }
      end

      def query
        { 'query' => validate }
      end

      def validate
        query_parameters.keys.each do |key|
          validator(key).new(key: key,
                             params: query_parameters,
                             class_name: self.class.name).
            validate
        end

        query_parameters
      end

      private

      def query_parameters
        params.delete_if { |_key, value| blank?(value) }
      end

      def blank?(value)
        value.to_s.strip == ''
      end

      def present?(value)
        !blank?(value)
      end

      def validator(key)
        validator_klass = "#{key.split('_').map(&:capitalize).join}Validator"
        klass = "Stattleship::Validators::#{validator_klass}"
        Kernel.const_get(klass)
      end
    end
  end
end
