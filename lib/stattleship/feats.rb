module Stattleship
  class Feat < OpenStruct
    def subject_name
      subject.name
    end

    def subject
      player || team
    end

    def to_sentence
      sentence_vs_on
    end

    def dump
      {
        accomplished_vs: accomplished_vs,
        accomplishment: accomplishment,
        actual: actual,
        category: category,
        description: description,
        game_id: game_id,
        game_slug: game_slug,
        humanized_stat_type: humanized_stat_type,
        level: level,
        level_numeric: level_numeric,
        name: name,
        on: on,
        opponent_abbrev: opponent_abbrev,
        opponent_location: opponent_location,
        opponent_name: opponent_name,
        opponent_nickname: opponent_nickname,
        opponent_slug: opponent_slug,
        player_id: player_id,
        player_slug: player_slug,
        sentence: sentence,
        sentence_on: sentence_on,
        sentence_vs: sentence_vs,
        sentence_vs_on: sentence_vs_on,
        subject: subject.dump,
        subject_id: subject_id,
        subject_name: subject_name,
        subject_slug: subject_slug,
        subject_team_abbrev: subject_team_abbrev,
        subject_team_location: subject_team_location,
        subject_team_name: subject_team_name,
        subject_team_nickname: subject_team_nickname,
        subject_team_slug: subject_team_slug,
        subject_type: subject_type,
        team_id: team_id,
        team_slug: team_slug,
        title: title,
        verb: verb,
        vs: vs,
      }
    end
  end

  class Feats < Stattleship::Endpoint
    def populate
      feats.each do |feat|
        populate_games(feat)

        games.each do |game|
          populate_game(game)
        end

        populate_teams(feat)

        populate_players(feat)
        populate_player(feat.player)
      end
    end
  end

  module FeatsRepresenter
    include Roar::JSON
    include Roar::Coercion
    include Stattleship::Models

    collection :feats, class: Stattleship::Feat do
      property :accomplished_vs
      property :accomplishment
      property :actual, type: BigDecimal
      property :category
      property :description
      property :game_id
      property :game_slug
      property :humanized_stat_type
      property :level
      property :level_numeric, type: Integer
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
      property :title
      property :team_id
      property :team_slug
      property :verb
      property :vs
      property :league_id
      property :season_id
    end

    collection :away_teams, extend: TeamRepresenter,
                            class: Team

    collection :home_teams, extend: TeamRepresenter,
                            class: Team

    collection :winning_teams, extend: TeamRepresenter,
                               class: Team

    collection :games, extend: GameRepresenter,
                       class: Game

    collection :leagues, extend: LeagueRepresenter,
                         class: League

    collection :seasons, extend: SeasonRepresenter,
                         class: Season

    collection :venues, extend: VenueRepresenter,
                        class: Venue

    collection :players, extend: PlayerRepresenter,
                         class: Player

    collection :teams, extend: TeamRepresenter,
                       class: Team
  end
end
