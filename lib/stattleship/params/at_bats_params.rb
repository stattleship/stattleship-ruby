module Stattleship
  module Params
    class AtBatsParams < Stattleship::Params::GameTimeParams
      attr_accessor :hitter_id,
                    :inning,
                    :game_id,
                    :team_id,
                    :hitter_team_id,
                    :hit_location,
                    :hit_type

      def params
        super.merge('game_id' => game_id,
                    'hitter_id' => hitter_id,
                    'hitter_team_id' => hitter_team_id,
                    'inning' => inning,
                    'hit_location' => hit_location,
                    'hit_type' => hit_type,
                   )
      end
    end
  end
end
