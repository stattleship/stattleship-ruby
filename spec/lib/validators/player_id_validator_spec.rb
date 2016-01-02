require 'spec_helper'

module Stattleship
  module Validators
    RSpec.describe PlayerIdValidator do
      context 'when the value matches the sport' do
        context 'for basketball' do
          it 'passes validation' do
            key = 'player_id'
            params = { 'player_id' => 'nba-kobe-bryant' }
            class_name = 'Stattleship::Params::BasketballGameLogsParams'

            validator = PlayerIdValidator.new(key: key,
                                              params: params,
                                              class_name: class_name)

            expect {
              validator.validates_sports_prefix
            }.not_to raise_error
          end
        end
      end

      context 'when the value fails to match the sport' do
        context 'for basketball' do
          it 'fails validation' do
            key = 'player_id'
            params = { 'player_id' => 'nba-kobe-bryant' }
            class_name = 'Stattleship::Params::FootballGameLogsParams'

            validator = PlayerIdValidator.new(key: key,
                                              params: params,
                                              class_name: class_name)

            expect {
              validator.validates_sports_prefix
            }.to raise_error ArgumentError
          end
        end
      end
    end
  end
end
