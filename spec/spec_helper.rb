# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

##
# ask rspec to play nice with AuthLogic: require & include Authlogic::TestCase in order to use method activate_authlogic
require "authlogic/test_case"
include Authlogic::TestCase

RSpec.configure do |config|

  config.mock_with :rspec

  config.use_transactional_fixtures = true # works with factory_girl too. needed to avoid factory_girl making objects that collide with objects left by previous test runs

end

##
# simulate a signed-in User for testing controllers.
def mock_signin
  activate_authlogic
  account = Factory.create :account
  user    = Factory.create :user, :account => account
  UserSession.create user
  return user, account
end
