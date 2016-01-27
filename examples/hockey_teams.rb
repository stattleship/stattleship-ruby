# Set your STATTLESHIP_ACCESS_TOKEN from https://www.stattleship.com in the examples/.env file

require 'dotenv'
Dotenv.load

dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'stattleship')
require 'pp'

# Construct params for the fetch
query_params = Stattleship::Params::HockeyTeamsParams.new

# fetch will automatically traverse the paginated response links
teams = Stattleship::HockeyTeams.fetch(params: query_params)

# the populated object
pp teams.first

# or, individual attributes
teams.each do |team|
  pp "#{team.nickname} #{team.colors.join(' ')}"
end

# "Ducks 000000 91764B EF5225"
# "Coyotes 841F27 000000 EFE1C6"
# "Bruins 000000 FFC422"
# "Sabres 002E62 FDBB2F AEB6B9"
# "Flames E03A3E FFC758 000000"
# "Hurricanes E03A3E 000000 8E8E90"
# "Blackhawks E3263A 000000"
# "Avalanche 8B2942 01548A 000000 A9B0B8"
# "Blue Jackets 00285C E03A3E A9B0B8"
# "Stars 006A4E 000000 C0C0C0"
# "Red Wings EC1F26"
# "Oilers 003777 E66A20"
# "Panthers C8213F 002E5F D59C05"
# "Kings 000000 AFB7BA"
# "Wild 025736 BF2B37 EFB410 EEE3C7"
# "Canadiens BF2F38 213770"
# "Predators FDBB2F 002E62"
# "Devils E03A3E 000000"
# "Islanders 00529B F57D31"
# "Rangers 0161AB E6393F"
# "Senators E4173E 000000 D69F0F"
# "Flyers F47940 000000"
# "Penguins 000000 D1BD80"
# "Sharks 05535D F38F20 000000"
# "Blues 0546A0 FFC325 101F48"
# "Lightning 013E7D 000000 C0C0C0"
# "Maple Leafs 003777"
# "Canucks 07346F 047A4A A8A9AD"
# "Capitals CF132B 00214E 000000"
# "Jets 002E62 0168AB A8A9AD"
# ...
