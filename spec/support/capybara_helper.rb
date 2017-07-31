require 'capybara/rails'
require 'capybara/rspec'

Capybara.javascript_driver = :webkit

Capybara::Webkit.configure do |config|
  WebMock.allow_net_connect!
  config.block_unknown_urls
end
