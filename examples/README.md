# Examples

Making Stattleship API calls is dead simple.

* Build and set parameters
* Use that to fetch data
* Use fully populated PORO's

The pattern is pretty much as follows:

```
query_params = Stattleship::Params::BasketballGameLogsParams.new
query_params.player_id = 'nba-stephen-curry'
query_params.since = '1 week ago'
game_logs = Stattleship::BasketballGameLogs.fetch(params: query_params)
pp game_logs.first
```

**That's it.**

Just repeat for other sports (ie, `HockeyGameLogsParams` and `HockeyGameLogs`) or other endpoints (`FootballPlayersParams` and `FootballPlayers`) etc.

The `fetch` call will automatically traverse the paginated response and you'll get easy to use PORO's of data specific to that model.

There's validation, too, on the params to make sure you set just the ones it accepts. Ie, you can't make a call to `FootballPlayers` with a player that whose slug doesn't start with `nfl-` and things like that.

## Prerequisites

You'll need

* Stattleship API Access Token from https://www.stattleship.com
* Set that in your `.env` file as `STATTLESHIP_ACCESS_TOKEN=your_token`
* To run examples, that .env file should be the the `/examples` dir.
* Copy the `sample.env` file, insert your token and save as `examples/.env`
* The `cd` to the `/examples` directory and `ruby <example>.rb` such that the .env loads

## Code

* [Basketball Game Logs](basketball_game_logs.rb)
  * Uses `BasketballGameLogsParams` and makes a `BasketballGameLogs` request
  * Use the `player_id` and `since` parameters to get Stephen Curry's game logs for the past week

* [Football Game Logs](basketball_game_logs.rb)
  * Uses `FootballGameLogsParams` and makes a `FootballGameLogs` request
  * Use the `player_id`, `inteval_type` and `since` parameters to get Cam Newton's game logs for the past weeks by specifying the interval type (divisionplayoffs, conferencechampionships, etc)

* [Hockey Games](hockey_games.rb)
  * Uses `HockeyGamesParams` and makes a `HockeyGames` request
  * Uses the `status` and `since` parameters to return ended Chicago Blackhawk games
  * Demonstrates `started_at` is a proper DateTime and renders `scoreline`s

* [Football Feats](football_feats.rb)
  * Uses `FootballFeatsParams` and makes a `FootballFeats` request
  * Uses `player_id` and `level_up` parameters to return Cam Newton regular season accomplishments

* [Basketball Injuries](basketball_injuries.rb)
  * Uses `BasketballInjuriesParams` and makes a `BasketballInjuries` request
  * Use the `team_id` and `since` to get Spurs injuries and show the injury note and its injury location (knee, back, etc)

* [Hockey Penalties](hockey_penalties.rb)
  * Uses `HockeyPenaltiesParams` and makes a `HockeyPenalties` request
  * Uses the `status` and `since` parameters to return penalties for ended Buffalo Sabres games in last 2 weeks
  * Demonstrates `minutes` is a proper Integer and renders a friendly-readable sentence describing the penalty

* [Football Players](football_players.rb)
  * Uses `FootballPlayersParams` and makes a `FootballPlayers` request
  * Uses `team_id` and `level_up` parameters to return Denver Broncos players
  * Demonstrates ability to filter and sort on a numeric `salary` to get list of players making more than $5M and where they went to `school`

* [Hockey Scoring Plays](hockey_scoring_plays.rb)
  * Uses `HockeyScoringPlaysParams` and makes a `HockeyScoringPlays` request
  * Uses the `status` and `since` parameters to return scoring plays for ended Dallas Stars games in last month
  * Demonstrates can access an array of players who assisted on each goal

* [Basketball Injuries](basketball_injuries.rb)
  * Uses `BasketballStatLeadersParams` and makes a `BasketballStatLeaders` request
  * Use the `type`, `stat` and `place` parameters get the top 5 three point leaders (with ties)

* [Football Stats](football_stats.rb)
  * Uses `FootballStatsParams` and makes a `FootballStats` request
  * Use the `type`, `stat` and `player_id` parameters get Aaron Rodgers TDs thrown in each game
  * Demonstrates ability to get `game`-specific data per stat, such as `weather_conditions`

* [Basketball Team Game Logs](basketball_team_game_logs.rb)
  * Uses `BasketballTeamGameLogsParams` and makes a `BasketballTeamGameLogs` request
  * Use the `team_id` and `since` parameters to get Cavaliers team game logs for the past week

* [Football Total Player Stats](football_total_player_stat.rb)
  * Uses `FootballTotalPlayerStatParams` and makes a `FootballTotalPlayerStat` request
  * Use the `player_id`, `type` and `stat` parameters to Adrian Peterson's total number of rushing attempts in the regular season
  * Demonstrates a fully populated player, so can access his `weight` etc

* [Hockey Total Team Stats](hockey_total_team_stat.rb)
  * Uses `HockeyTotalTeamStatParams` and makes a `HockeyTotalTeamStat` request
  * Use the `team_id` and `stat` parameters to the total number of third period goals the Canadiens has scored

* [Basketball Top Stats](basketball_top_stats.rb)
  * Uses `BasketballTopStatsParams` and makes a `BasketballTopStats` request
  * Use the `type`, `stat`, and `place` parameters to return the 3 best (highest) offensive rebounding performances in NBA
  * Demonstrates a fully populated game, so know when this was accomplished

* [Basketball Winning Streaks](basketball_winning_streaks.rb)
  * Uses `BasketballTeamOutcomeStreaksParams` and makes a `BasketballTeamOutcomeStreaks` request
  * Use the `outcome` and `current` parameters to return winning streaks that filters to those more than 2 games in length
  * Demonstrates a fully populated streak

* [Hockey Ranked Streaks](hockey_team_ranked_streaks.rb)
  * Uses `HockeyTeamOutcomeStreaksParams` and makes a `HockeyTeamOutcomeStreaks` request
  * Use the `team_id` and `ranked` parameters to the top 3 ranked streaks in length
  * Demonstrates a fully populated streak with season and league

* [Game Officials](officials.rb)
  * Uses games params and request for each sport
  * Demonstrates a fully populated list of officials for each game

* [Game Log Officials](officials.rb)
  * Uses game_log and team_game_log params and request for Hockey
  * Demonstrates a fully populated list of officials for each game on the game_log
