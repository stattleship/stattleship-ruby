module Stattleship
  module Params
    class QueryParams
      def params
        {}
      end

      def query
        { 'query' => query_parameters }
      end

      private

      def query_parameters
        params.delete_if { |_key, value| blank?(value) }
      end

      def blank?(value)
        value.to_s.strip == ''
      end
    end
  end
end
