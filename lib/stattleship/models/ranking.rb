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

      def short_date
        game.short_date if game
      end

      def to_sentence
        description
      end

      def game_hash
        if game
          game.dump
        end
      end

      def team_hash
        if team
          team.dump
        end
      end

      def dump
        {
          description: description,
          ordinal_place: ordinal_place,
          stat: stat,
          interval_type: interval_type,
          interval_value: interval_value,
          statline: statline,
          superlative: superlative,
          title: title,
          place: place,
          stat_value: stat_value,
          data: data,
          game: game_hash,
          team: team_hash,
        }
      end
    end

    module RankingRepresenter
      include Roar::JSON
      include Roar::Coercion

      [
        :id,
        :description,
        :ordinal_place,
        :stat,
        :interval_type,
        :interval_value,
        :statline,
        :superlative,
        :title
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
