module Stattleship
  module Params
    class QueryParams
      def query
        { 'query' => query_parameters }
      end

      private

      def query_parameters
        params.delete_if { |key, value| value.nil? }
      end
    end
  end
end
