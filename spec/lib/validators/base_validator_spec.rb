require 'spec_helper'

module Stattleship
  module Validators
    RSpec.describe BaseValidator do
      describe '#validate' do
        it 'forces subclassed validators to implement' do
          validator = BaseValidator.new(key: '',
                                        params: '',
                                        class_name: '')

          expect { validator.validate }.to raise_error RuntimeError
        end
      end

      describe '#validates_positive_integer' do
        context 'when the value is not an integer' do
          context 'because it is a string' do
            it 'fails validation' do
              key = 'number'
              params = { 'number' => 'foo' }
              class_name = ''

              validator = BaseValidator.new(key: key,
                                            params: params,
                                            class_name: class_name)

              expect {
                validator.validates_positive_integer
              }.to raise_error ArgumentError
            end
          end

          context 'because it is a decimal' do
            it 'fails validation' do
              key = 'number'
              params = { 'number' => 2.4 }
              class_name = ''

              validator = BaseValidator.new(key: key,
                                            params: params,
                                            class_name: class_name)

              expect {
                validator.validates_positive_integer
              }.to raise_error ArgumentError
            end
          end
        end

        context 'when the value is negative' do
          it 'fails validation' do
            key = 'number'
            params = { 'number' => -3 }
            class_name = ''

            validator = BaseValidator.new(key: key,
                                          params: params,
                                          class_name: class_name)

            expect {
              validator.validates_positive_integer
            }.to raise_error ArgumentError
          end
        end

        context 'when the value is positive' do
          it 'passes validation' do
            key = 'number'
            params = { 'number' => 3 }
            class_name = ''

            validator = BaseValidator.new(key: key,
                                          params: params,
                                          class_name: class_name)

            expect {
              validator.validates_positive_integer
            }.not_to raise_error
          end
        end
      end

      describe '#validates_sports_prefix' do
        context 'when the value is blank' do
          it 'passes validation' do
            key = 'team_id'
            params = { 'team_id' => nil }
            class_name = 'Stattleship::Params::HockeyGameLogsParams'

            validator = BaseValidator.new(key: key,
                                          params: params,
                                          class_name: class_name)

            expect {
              validator.validates_sports_prefix
            }.not_to raise_error
          end
        end

        context 'when the value matches the sport' do
          context 'for basketball' do
            it 'passes validation' do
              key = 'team_id'
              params = { 'team_id' => 'nba-cle' }
              class_name = 'Stattleship::Params::BasketballGameLogsParams'

              validator = BaseValidator.new(key: key,
                                            params: params,
                                            class_name: class_name)

              expect {
                validator.validates_sports_prefix
              }.not_to raise_error
            end
          end

          context 'for football' do
            it 'passes validation' do
              key = 'player_id'
              params = { 'player_id' => 'nfl-tom-brady' }
              class_name = 'Stattleship::Params::FootballStatLeadersParams'

              validator = BaseValidator.new(key: key,
                                            params: params,
                                            class_name: class_name)

              expect {
                validator.validates_sports_prefix
              }.not_to raise_error
            end
          end

          context 'for hockey' do
            it 'passes validation' do
              key = 'player_id'
              params = { 'player_id' => 'nhl-tyler-seguin' }
              class_name = 'Stattleship::Params::HockeyStatLeadersParams'

              validator = BaseValidator.new(key: key,
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
              key = 'team_id'
              params = { 'team_id' => 'nfl-ny' }
              class_name = 'Stattleship::Params::BasketballGameLogsParams'

              validator = BaseValidator.new(key: key,
                                            params: params,
                                            class_name: class_name)

              expect {
                validator.validates_sports_prefix
              }.to raise_error ArgumentError
            end
          end

          context 'for football' do
            it 'fails validation' do
              key = 'player_id'
              params = { 'player_id' => 'nhl-tyler-seguin' }
              class_name = 'Stattleship::Params::FootballStatLeadersParams'

              validator = BaseValidator.new(key: key,
                                            params: params,
                                            class_name: class_name)

              expect {
                validator.validates_sports_prefix
              }.to raise_error ArgumentError
            end
          end

          context 'for hockey' do
            it 'fails validation' do
              key = 'player_id'
              params = { 'player_id' => 'nba-lebron-james' }
              class_name = 'Stattleship::Params::HockeyStatLeadersParams'

              validator = BaseValidator.new(key: key,
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
end
