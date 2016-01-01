module Stattleship
  module Params
    class QueryParams
      def query
        { 'query' => params }
      end
    end
  end
end
