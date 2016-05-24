# stattleship-ruby

[![Join the chat at https://gitter.im/stattleship/stattleship-ruby](https://badges.gitter.im/stattleship/stattleship-ruby.svg)](https://gitter.im/stattleship/stattleship-ruby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
Stattleship API Ruby client

[![Build Status](https://travis-ci.org/stattleship/stattleship-ruby.svg?branch=master)](https://travis-ci.org/stattleship/stattleship-ruby)

Check out the [Stattleship API](https://www.stattleship.com) - The Sports Data API you've always wanted

Meaningful. Developer-Friendly.

:football: :basketball: and :black_circle: :ice_hockey_stick_and_puck: :snowflake: and :baseball: !

We're gonna need a bigger :boat:!

## Installation

```
gem install stattleship-ruby
```

## Usage

```
gem 'stattleship-ruby', '~> 0.1.23'
```

### Build

```
gem build stattleship-ruby.gemspec
```

### Install

```
gem install stattleship-ruby-0.1.23.gem
```
## Prerequisites

You'll need

* Stattleship [API Access Token from https://www.stattleship.com](https://www.stattleship.com)

# Configuration

There are two ways to configure the gem.

```
Stattleship.configure do |config|
  config.api_token = YOUR_TOKEN
end
```

or via a `.env`

```
STATTLESHIP_ACCESS_TOKEN=YOUR_TOKEN
```

## API Documentation

* [Developer API Reference](http://developers.stattleship.com/)

## Examples

Check out some [examples](examples/README.md) of how to make API calls.

It's dead simple.

* Build and set parameters
* Use that to fetch data
* Use fully populated PORO's with real Ruby datatypes (DateTime, Integers, bool) not just JSON strings

The pattern is pretty much as follows:

```
query_params = Stattleship::Params::BasketballGameLogsParams.new
query_params.player_id = 'nba-stephen-curry'
query_params.since = '1 week ago'
game_logs = Stattleship::BasketballGameLogs.fetch(params: query_params)
pp game_logs.first
```

**That's it.**

If you want to see what the example JSON responses are, have a look in [fixtures](https://github.com/stattleship/stattleship-ruby/tree/master/spec/fixtures) as there are samples for each sport.

## Apps

We're using the Stattleship API and this gem! You can, too.

* [Glickman: Your statmoji(tm) sports slackbot powered by Slack and the Stattleship API.](https://github.com/stattleship/glickman)

## Questions?

Follow us on [@stattleship](https://twitter.com/stattleship) or join our free, public [Fanboat](https://fanboat.stattleship.com/) Slack group where you can try out "cosell" -- an instance of Glickman -- and get API updates.
