module Stattleship
  module Models
    class ScoringPlay < OpenStruct
      def away_team
        game.away_team
      end

      def home_team
        game.home_team
      end

      def winning_team
        game.winning_team
      end

      def away_team_name
        away_team.name
      end

      def home_team_name
        home_team.name
      end

      def winning_team_name
        winning_team.name
      end

      def city
        venue.city
      end

      def league_name
        league.name
      end

      def league_abbreviation
        league.abbreviation
      end

      def player_name
        # player.name
      end

      def opponent_name
        opponent.name
      end

      def opponent_full_name
        opponent.full_name
      end

      def scoreline
        game.scoreline
      end

      def team_name
        team.name
      end

      def team_full_name
        team.full_name
      end

      def venue
        game.venue
      end

      def venue_name
        venue.name
      end

      def scorers
        return unless scoring_players

        scoring_players.select do |scoring_player|
          scoring_player.role == 'scorer'
        end
      end

      def scorer
        scorers.first if scorers
      end

      def scorer_name
        if scorer
          scorer.player_name
        else
          ''
        end
      end

      def assists
        return unless scoring_players

        scoring_players.select do |scoring_player|
          scoring_player.role == 'assist'
        end
      end

      def assist_names
        if assists
          assists.map(&:player_name).join(', ')
        else
          'unassisted'
        end
      end

      def period_time
        Time.at(period_seconds).utc.strftime('%M:%S')
      end

      def period_abbreviation
        if game.hockey?
          "P"
        else
          "Q"
        end
      end

      def period
        "#{period_number}#{period_abbreviation}"
      end

      def at
        "#{period_time} of #{period}"
      end

      def scoring_player_names
        if scoring_players
          scoring_players.map(&:player_name).join(', ')
        else
          ''
        end
      end

      def scoring_player_role_names
        if scoring_players
          scoring_players.map(&:name).join(', ')
        else
          ''
        end
      end

      def scoring_players_info
        if scoring_players
          player_names = scoring_players.map(&:player_name)
          role_names = scoring_players.map(&:name)
          player_names.zip(role_names).flatten.compact.join(', ')
        else
          ''
        end
      end

      def vs
        if game
          "vs #{opponent_name} #{game.short_date}"
        end
      end

      def to_sentence
        if game.hockey?
          "#{scorer_name} (#{assist_names}) - #{at} - #{vs}"
        elsif game.football?
          "#{period_number} QTR #{period_time} - #{points} points - #{yards} yards - #{scoring_players_info} - #{vs}"
        else
          ''
        end
      end
    end

    module ScoringPlayRepresenter
      include Roar::JSON
      include Roar::Coercion
      include Stattleship::Models
      include Virtus.model

      property :id
      property :game_id
      property :opponent_id
      property :team_id

      property :conversion
      property :conversion_points, type: Integer
      property :empty_net, type: Boolean, default: false
      property :name
      property :period_number, type: Integer
      property :period_seconds, type: Integer
      property :points, type: Integer
      property :scored_at, type: DateTime
      property :scoring_conversion
      property :scoring_conversion_points, type: Integer
      property :scoring_how
      property :scoring_method
      property :scoring_type
      property :time_code
      property :yards, type: Integer

      collection :scoring_player_ids
    end
  end
end
