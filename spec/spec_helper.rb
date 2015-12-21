require 'rspec'
require 'stattleship'
require 'webmock/rspec'

Dir['spec/support/**/*.rb'].each { |file| require File.expand_path(file) }

RSpec.configure do |config|
  config.order = 'random'
  config.include Constants
end

WebMock.disable_net_connect!
