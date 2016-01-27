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

## Code

* [Basketball Game Logs](basketball_game_logs.rb)
    * Uses `BasketballGameLogsParams` and makes a `BasketballGameLogs` request
    * Use the `player_id` and `since` parameters to get Stephen Curry's game logs fro the past week
