require 'spec_helper'

module Stattleship
  RSpec.describe StatLeaders do

    describe '#headers' do
      it 'returns all the header values for Net::HTTP' do
        json = '{
  "players": [
    {
      "id": "07fc28d7-bbcf-48ee-af97-a6836bf3e3d3",
      "created_at": "2015-12-26T02:42:03-05:00",
      "updated_at": "2015-12-29T05:36:55-05:00",
      "active": true,
      "defensive": false,
      "first_name": "Vladimir",
      "handedness": "left",
      "height": 72,
      "unit_of_height": "inches",
      "last_name": "Tarasenko",
      "name": "Vladimir Tarasenko",
      "offensive": true,
      "position_abbreviation": "RW",
      "position_name": "Right Wing",
      "salary": 8000000,
      "humanized_salary": "8,000,000",
      "salary_currency": "USD",
      "school": null,
      "slug": "nhl-vladimir-tarasenko",
      "sport": "hockey",
      "weight": 219,
      "unit_of_weight": "pounds",
      "years_of_experience": 4,
      "league_id": "48803e9e-c4ec-414a-a85d-9abfa6e9cfd9",
      "playing_position_id": "0d13fcf4-862c-4e9e-82ad-6642f18527eb",
      "team_id": "4ca89483-65ae-484d-bda9-eacba9ff4915"
    },
    {
      "id": "7fd9da41-1419-48c9-938c-b136be4389d4",
      "created_at": "2015-12-26T02:41:44-05:00",
      "updated_at": "2015-12-29T05:36:59-05:00",
      "active": true,
      "defensive": false,
      "first_name": "Patrick",
      "handedness": "left",
      "height": 71,
      "unit_of_height": "inches",
      "last_name": "Kane",
      "name": "Patrick Kane",
      "offensive": true,
      "position_abbreviation": "RW",
      "position_name": "Right Wing",
      "salary": 13800000,
      "humanized_salary": "13,800,000",
      "salary_currency": "USD",
      "school": null,
      "slug": "nhl-patrick-kane",
      "sport": "hockey",
      "weight": 177,
      "unit_of_weight": "pounds",
      "years_of_experience": 9,
      "league_id": "48803e9e-c4ec-414a-a85d-9abfa6e9cfd9",
      "playing_position_id": "0d13fcf4-862c-4e9e-82ad-6642f18527eb",
      "team_id": "a345b10e-87b5-4635-bf24-fd6be058346f"
    },
    {
      "id": "cf94ec29-037c-49e9-aafa-550be2efb5db",
      "created_at": "2015-12-26T02:42:14-05:00",
      "updated_at": "2015-12-29T05:35:06-05:00",
      "active": true,
      "defensive": false,
      "first_name": "Tyler",
      "handedness": "right",
      "height": 73,
      "unit_of_height": "inches",
      "last_name": "Seguin",
      "name": "Tyler Seguin",
      "offensive": true,
      "position_abbreviation": "C",
      "position_name": "Center",
      "salary": 6000000,
      "humanized_salary": "6,000,000",
      "salary_currency": "USD",
      "school": null,
      "slug": "nhl-tyler-seguin",
      "sport": "hockey",
      "weight": 195,
      "unit_of_weight": "pounds",
      "years_of_experience": 6,
      "league_id": "48803e9e-c4ec-414a-a85d-9abfa6e9cfd9",
      "playing_position_id": "de234539-31b3-4223-ad8c-2958961d2dc4",
      "team_id": "5786217b-24e4-4827-8fb9-b4bcd388b869"
    },
    {
      "id": "859c61c4-2dc8-418a-b788-dd1cef828f8c",
      "created_at": "2015-12-26T02:42:56-05:00",
      "updated_at": "2015-12-29T05:37:24-05:00",
      "active": true,
      "defensive": false,
      "first_name": "Alex",
      "handedness": "right",
      "height": 75,
      "unit_of_height": "inches",
      "last_name": "Ovechkin",
      "name": "Alex Ovechkin",
      "offensive": true,
      "position_abbreviation": "RW",
      "position_name": "Right Wing",
      "salary": 10000000,
      "humanized_salary": "10,000,000",
      "salary_currency": "USD",
      "school": null,
      "slug": "nhl-alex-ovechkin",
      "sport": "hockey",
      "weight": 230,
      "unit_of_weight": "pounds",
      "years_of_experience": 11,
      "league_id": "48803e9e-c4ec-414a-a85d-9abfa6e9cfd9",
      "playing_position_id": "0d13fcf4-862c-4e9e-82ad-6642f18527eb",
      "team_id": "54276c06-42a0-4649-838c-a462451d54c8"
    },
    {
      "id": "4702bdb7-c7ea-47a7-8bf3-d72fe967c4ef",
      "created_at": "2015-12-26T02:42:16-05:00",
      "updated_at": "2015-12-29T05:35:04-05:00",
      "active": true,
      "defensive": false,
      "first_name": "Jamie",
      "handedness": "left",
      "height": 74,
      "unit_of_height": "inches",
      "last_name": "Benn",
      "name": "Jamie Benn",
      "offensive": true,
      "position_abbreviation": "LW",
      "position_name": "Left Wing",
      "salary": 5750000,
      "humanized_salary": "5,750,000",
      "salary_currency": "USD",
      "school": null,
      "slug": "nhl-jamie-benn",
      "sport": "hockey",
      "weight": 210,
      "unit_of_weight": "pounds",
      "years_of_experience": 7,
      "league_id": "48803e9e-c4ec-414a-a85d-9abfa6e9cfd9",
      "playing_position_id": "97279158-d3fb-4c6d-97f5-d8ce36fee674",
      "team_id": "5786217b-24e4-4827-8fb9-b4bcd388b869"
    },
    {
      "id": "5ae09b7f-921a-414d-853e-304f5f7d4d2d",
      "created_at": "2015-12-26T02:41:53-05:00",
      "updated_at": "2015-12-29T05:36:24-05:00",
      "active": true,
      "defensive": false,
      "first_name": "Joe",
      "handedness": "right",
      "height": 71,
      "unit_of_height": "inches",
      "last_name": "Pavelski",
      "name": "Joe Pavelski",
      "offensive": true,
      "position_abbreviation": "C",
      "position_name": "Center",
      "salary": 6000000,
      "humanized_salary": "6,000,000",
      "salary_currency": "USD",
      "school": null,
      "slug": "nhl-joe-pavelski",
      "sport": "hockey",
      "weight": 190,
      "unit_of_weight": "pounds",
      "years_of_experience": 10,
      "league_id": "48803e9e-c4ec-414a-a85d-9abfa6e9cfd9",
      "playing_position_id": "de234539-31b3-4223-ad8c-2958961d2dc4",
      "team_id": "4a2527de-0e8b-49cb-9d36-8101ccac5265"
    }
  ],
  "leagues": [
    {
      "id": "48803e9e-c4ec-414a-a85d-9abfa6e9cfd9",
      "created_at": "2015-11-28T22:33:56-05:00",
      "updated_at": "2015-11-28T22:33:56-05:00",
      "abbreviation": "NHL",
      "color": null,
      "minutes_per_period": null,
      "name": "National Hockey League",
      "periods": null,
      "slug": "nhl",
      "sport": "hockey"
    }
  ],
  "playing_positions": [
    {
      "id": "0d13fcf4-862c-4e9e-82ad-6642f18527eb",
      "created_at": "2015-12-09T05:04:21-05:00",
      "updated_at": "2015-12-09T05:04:21-05:00",
      "abbreviation": "RW",
      "description": null,
      "formation": "offensive",
      "name": "Right Wing",
      "league_id": "48803e9e-c4ec-414a-a85d-9abfa6e9cfd9"
    },
    {
      "id": "de234539-31b3-4223-ad8c-2958961d2dc4",
      "created_at": "2015-12-09T05:04:22-05:00",
      "updated_at": "2015-12-09T05:04:22-05:00",
      "abbreviation": "C",
      "description": null,
      "formation": "offensive",
      "name": "Center",
      "league_id": "48803e9e-c4ec-414a-a85d-9abfa6e9cfd9"
    },
    {
      "id": "97279158-d3fb-4c6d-97f5-d8ce36fee674",
      "created_at": "2015-12-09T05:04:21-05:00",
      "updated_at": "2015-12-09T05:04:21-05:00",
      "abbreviation": "LW",
      "description": null,
      "formation": "offensive",
      "name": "Left Wing",
      "league_id": "48803e9e-c4ec-414a-a85d-9abfa6e9cfd9"
    }
  ],
  "teams": [
    {
      "id": "4ca89483-65ae-484d-bda9-eacba9ff4915",
      "created_at": "2015-11-28T22:33:56-05:00",
      "updated_at": "2015-12-09T09:15:47-05:00",
      "location": "St. Louis",
      "name": "St. Louis",
      "nickname": "Blues",
      "slug": "nhl-stl",
      "division_id": "8e46750a-615a-4362-8468-26a8541fc713",
      "league_id": "48803e9e-c4ec-414a-a85d-9abfa6e9cfd9"
    },
    {
      "id": "a345b10e-87b5-4635-bf24-fd6be058346f",
      "created_at": "2015-11-28T22:33:56-05:00",
      "updated_at": "2015-12-14T08:38:31-05:00",
      "location": "Chicago",
      "name": "Chicago",
      "nickname": "Blackhawks",
      "slug": "nhl-chi",
      "division_id": "8e46750a-615a-4362-8468-26a8541fc713",
      "league_id": "48803e9e-c4ec-414a-a85d-9abfa6e9cfd9"
    },
    {
      "id": "5786217b-24e4-4827-8fb9-b4bcd388b869",
      "created_at": "2015-11-28T22:33:56-05:00",
      "updated_at": "2015-12-09T09:15:48-05:00",
      "location": "Dallas",
      "name": "Dallas",
      "nickname": "Stars",
      "slug": "nhl-dal",
      "division_id": "8e46750a-615a-4362-8468-26a8541fc713",
      "league_id": "48803e9e-c4ec-414a-a85d-9abfa6e9cfd9"
    },
    {
      "id": "54276c06-42a0-4649-838c-a462451d54c8",
      "created_at": "2015-11-28T22:33:56-05:00",
      "updated_at": "2015-12-09T09:15:48-05:00",
      "location": "Washington",
      "name": "Washington",
      "nickname": "Capitals",
      "slug": "nhl-was",
      "division_id": "2a45d995-a56b-43c8-838d-700e5cf1f922",
      "league_id": "48803e9e-c4ec-414a-a85d-9abfa6e9cfd9"
    },
    {
      "id": "4a2527de-0e8b-49cb-9d36-8101ccac5265",
      "created_at": "2015-11-28T22:33:56-05:00",
      "updated_at": "2015-12-09T09:15:47-05:00",
      "location": "San Jose",
      "name": "San Jose",
      "nickname": "Sharks",
      "slug": "nhl-sj",
      "division_id": "11740eea-c575-44e9-b4f5-a80805703ad0",
      "league_id": "48803e9e-c4ec-414a-a85d-9abfa6e9cfd9"
    }
  ],
  "stat_leaders": [
    {
      "stat_name": "goals",
      "stat": 26,
      "place": 1,
      "player_id": "07fc28d7-bbcf-48ee-af97-a6836bf3e3d3"
    },
    {
      "stat_name": "goals",
      "stat": 23,
      "place": 2,
      "player_id": "7fd9da41-1419-48c9-938c-b136be4389d4"
    },
    {
      "stat_name": "goals",
      "stat": 23,
      "place": 2,
      "player_id": "cf94ec29-037c-49e9-aafa-550be2efb5db"
    },
    {
      "stat_name": "goals",
      "stat": 23,
      "place": 2,
      "player_id": "859c61c4-2dc8-418a-b788-dd1cef828f8c"
    },
    {
      "stat_name": "goals",
      "stat": 23,
      "place": 2,
      "player_id": "4702bdb7-c7ea-47a7-8bf3-d72fe967c4ef"
    },
    {
      "stat_name": "goals",
      "stat": 21,
      "place": 3,
      "player_id": "5ae09b7f-921a-414d-853e-304f5f7d4d2d"
    }
  ]
}'
        stat_leaders = StatLeaders.new
        stat_leaders.extend(Stattleship::StatLeadersRepresenter)

        stat_leaders.from_json(json)

        stat_leaders.leaders.each do |leader|
          puts "#{leader.team.nickname} #{leader.player.position_name} #{leader.player.name} is in #{leader.place} place with #{leader.stat} #{leader.stat_name}"
        end
      end
    end
  end
end
