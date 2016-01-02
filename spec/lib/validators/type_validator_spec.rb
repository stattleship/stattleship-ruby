require 'spec_helper'

module Stattleship
  module Validators
    RSpec.describe TypeValidator do
      describe 'validate' do
        context 'when the value is blank' do
          it 'passes validation' do
            key = 'type'
            params = { 'type' => nil }
            class_name = 'Stattleship::Params::HockeyGameLogsParams'

            validator = TypeValidator.new(key: key,
                                          params: params,
                                          class_name: class_name)

            expect {
              validator.validates_sport_prefix
            }.not_to raise_error
          end
        end

        context 'when the value matches the sport/league' do
          context 'for basketball' do
            it 'passes validation' do
              key = 'type'
              params = { 'type' => 'basketball_offensive_stat' }
              class_name = 'Stattleship::Params::BasketballGameLogsParams'

              validator = TypeValidator.new(key: key,
                                            params: params,
                                            class_name: class_name)

              expect {
                validator.validates_sport_prefix
              }.not_to raise_error
            end
          end

          context 'for football' do
            it 'passes validation' do
              key = 'type'
              params = { 'type' => 'football_passing_stat' }
              class_name = 'Stattleship::Params::FootballStatLeadersParams'

              validator = TypeValidator.new(key: key,
                                            params: params,
                                            class_name: class_name)

              expect {
                validator.validates_sport_prefix
              }.not_to raise_error
            end
          end

          context 'for hockey' do
            it 'passes validation' do
              key = 'type'
              params = { 'type' => 'hockey_player_stat' }
              class_name = 'Stattleship::Params::HockeyStatLeadersParams'

              validator = TypeValidator.new(key: key,
                                            params: params,
                                            class_name: class_name)

              expect {
                validator.validates_sport_prefix
              }.not_to raise_error
            end
          end
        end

        context 'when the value fails to match the sport' do
          context 'for basketball' do
            it 'fails validation' do
              key = 'type'
              params = { 'type' => 'football_passing_stat' }
              class_name = 'Stattleship::Params::BasketballGameLogsParams'

              validator = TypeValidator.new(key: key,
                                            params: params,
                                            class_name: class_name)

              expect {
                validator.validates_sport_prefix
              }.to raise_error ArgumentError
            end
          end

          context 'for football' do
            it 'fails validation' do
              key = 'type'
              params = { 'type' => 'hockey_defensive_stat' }
              class_name = 'Stattleship::Params::FootballStatLeadersParams'

              validator = TypeValidator.new(key: key,
                                            params: params,
                                            class_name: class_name)

              expect {
                validator.validates_sport_prefix
              }.to raise_error ArgumentError
            end
          end

          context 'for hockey' do
            it 'fails validation' do
              key = 'type'
              params = { 'type' => 'basketball_rebounding_stat' }
              class_name = 'Stattleship::Params::HockeyStatLeadersParams'

              validator = TypeValidator.new(key: key,
                                            params: params,
                                            class_name: class_name)

              expect {
                validator.validates_sport_prefix
              }.to raise_error ArgumentError
            end
          end
        end
      end
    end
  end
end
