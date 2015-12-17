require 'rspec'
require 'stattleship'
require 'webmock/rspec'

Dir['spec/support/**/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.order = 'random'
end

WebMock.disable_net_connect!
