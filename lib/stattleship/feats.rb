module Stattleship
  class Feat < OpenStruct
    def name
      subject.name
    end

    def subject
      player || team
    end

    def actual_value
      actual.to_f
    end

    def to_sentence
      sentence_vs_on
    end
  end

  class Feats < Stattleship::Endpoint
    def populate
      feats.each do |feat|
        populate_games(feat)

        populate_teams(feat)

        populate_players(feat)
        populate_player(feat.player)
      end
    end
  end

  module FeatsRepresenter
    include Roar::JSON

    collection :feats, class: Stattleship::Feat do
      property :accomplished_vs
      property :accomplishment
      property :actual
      property :category
      property :game_id
      property :game_slug
      property :humanized_stat_type
      property :level
      property :name
      property :on
      property :opponent_abbrev
      property :opponent_location
      property :opponent_name
      property :opponent_nickname
      property :opponent_slug
      property :player_id
      property :player_slug
      property :sentence
      property :sentence_on
      property :sentence_vs
      property :sentence_vs_on
      property :subject_id
      property :subject_name
      property :subject_team_name
      property :subject_team_abbrev
      property :subject_team_location
      property :subject_team_nickname
      property :subject_team_slug
      property :subject_type
      property :subject_slug
      property :team_id
      property :team_slug
      property :verb
      property :vs
      property :league_id
      property :season_id

      # property :subject, class: OpenStruct do
      #   property :type
      #   property :id
      # end
    end

    collection :games, extend: Stattleship::Models::GameRepresenter,
                       class: Stattleship::Models::Game

    collection :leagues, extend: Stattleship::Models::LeagueRepresenter,
                         class: Stattleship::Models::League

    collection :seasons, extend: Stattleship::Models::SeasonRepresenter,
                         class: Stattleship::Models::Season

    collection :venues, extend: Stattleship::Models::VenueRepresenter,
                        class: Stattleship::Models::Venue

    collection :players, extend: Stattleship::Models::PlayerRepresenter,
                         class: Stattleship::Models::Player

    collection :teams, extend: Stattleship::Models::TeamRepresenter,
                       class: Stattleship::Models::Team
  end
end
