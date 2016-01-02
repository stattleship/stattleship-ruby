require 'spec_helper'

module Stattleship
  module Validators
    RSpec.describe TeamIdValidator do
      describe '#validate' do
        context 'when the value matches the sport' do
          context 'for basketball' do
            it 'passes validation' do
              key = 'team_id'
              params = { 'team_id' => 'nba-bos' }
              class_name = 'Stattleship::Params::BasketballGameLogsParams'

              validator = TeamIdValidator.new(key: key,
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
              key = 'team_id'
              params = { 'team_id' => 'nba-bos' }
              class_name = 'Stattleship::Params::FootballGameLogsParams'

              validator = TeamIdValidator.new(key: key,
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
