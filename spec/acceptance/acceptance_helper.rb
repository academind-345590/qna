require 'rails_helper'

RSpec.configure do |config|
  # Capybara webkit
  Capybara.javascript_driver = :webkit
  
  # rails_helper triger
  config.use_transactional_fixtures = false

  # Database cleaner
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
  
end