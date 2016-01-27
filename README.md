# stattleship-ruby

[![Join the chat at https://gitter.im/stattleship/stattleship-ruby](https://badges.gitter.im/stattleship/stattleship-ruby.svg)](https://gitter.im/stattleship/stattleship-ruby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
Stattleship API Ruby client

[![Build Status](https://travis-ci.org/stattleship/stattleship-ruby.svg?branch=master)](https://travis-ci.org/stattleship/stattleship-ruby)

Check out the [Stattleship API](https://www.stattleship.com) - The Sports Data API you've always wanted

Affordable. Meaningful. Developer-Friendly.

:football: :basketball: and :black_circle: :ice_hockey_stick_and_puck: :snowflake: with :baseball: coming soon.

We're gonna need a bigger :boat:!

# Examples

Check out some [examples](examples/README.md) of how to make API calls.

It's dead simple.

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

# Apps Using the Stattleship API and this Gem

* [Glickman: Your statmoji(tm) sports slackbot powered by Slack and the Stattleship API.](https://github.com/stattleship/glickman) - https://github.com/stattleship/glickman

* [Oglethorpe: Stats + Scores + Photos! using the Stattleship API.](https://github.com/stattleship/oglethorpe) - https://github.com/stattleship/oglethorpe
