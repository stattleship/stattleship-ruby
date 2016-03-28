module Stattleship
  module Models
    class Ranking < OpenStruct
      def player_name
        player.name if player
      end

      def season
        game.season if game
      end

      def season_name
        season.name if season
      end

      def team_name
        team.name if team
      end

      def ordinal_place
        place.ordinalize if place
      end

      def whence
        if interval_type == 'season'
          "in the #{season_name} season on #{short_date}"
        elsif interval_type == 'day'
          "for #{short_date}"
        else
          ''
        end
      end

      def short_date
        game.short_date if game
      end

      def to_sentence
        "#{player_name} has the #{ordinal_place} best game #{whence} with #{statline}"
      end

      def statline
        if data
          [
            "#{data['points']} P",
            "#{data['field_goals_made']} FG",
            "#{data['free_throws_made']} FT",
            "#{data['three_pointers_made']} 3PT",
            "#{data['rebounds_total']} RBD",
            "#{data['blocks']} B",
            "#{data['steals']} S",
            ].join(', ')
        end
      end
    end

    module RankingRepresenter
      include Roar::JSON
      include Roar::Coercion

      [
        :id,
        :stat,
        :interval_type,
        :interval_value,
      ].each do |attribute|
        property attribute
      end

      [
        :place,
      ].each do |attribute|
        property attribute, type: Integer
      end

      [
        :stat_value,
      ].each do |attribute|
        property attribute, type: BigDecimal
      end

      [
        :data,
      ].each do |attribute|
        property attribute, type: Hash
      end

      [
        :game_id,
        :player_id,
        :team_id
      ].each do |relationship|
        property relationship
      end
    end
  end
end
