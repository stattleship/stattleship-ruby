module Stattleship
  module Params
    class PlayersParams < Stattleship::Params::QueryParams
      attr_accessor :birth_date, :team_id

      def params
        super.merge('birth_date' => birth_date,
                    'team_id' => team_id)
      end
    end
  end
end
