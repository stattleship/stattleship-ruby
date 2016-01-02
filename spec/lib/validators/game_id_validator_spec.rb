require 'spec_helper'

module Stattleship
  module Validators
    RSpec.describe GameIdValidator do
      describe '#validate' do
        context 'when the value matches the sport' do
          context 'for basketball' do
            it 'passes validation' do
              key = 'game_id'
              params = { 'game_id' => 'nba-2015-2016-lac-sac-2015-10-28-1900' }
              class_name = 'Stattleship::Params::BasketballGameLogsParams'

              validator = SeasonIdValidator.new(key: key,
                                                params: params,
                                                class_name: class_name)

              expect {
                validator.validates_league_prefix
              }.not_to raise_error
            end
          end
        end

        context 'when the value fails to match the sport' do
          context 'for basketball' do
            it 'fails validation' do
              key = 'game_id'
              params = { 'game_id' => 'nba-2015-2016-lac-sac-2015-10-28-1900' }
              class_name = 'Stattleship::Params::FootballGameLogsParams'

              validator = SeasonIdValidator.new(key: key,
                                                params: params,
                                                class_name: class_name)

              expect {
                validator.validates_league_prefix
              }.to raise_error ArgumentError
            end
          end
        end
      end
    end
  end
end
