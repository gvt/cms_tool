source 'http://rubygems.org'

gem 'rails', '3.0.3'
gem "autotest"
## Had to add a different fork of authlogic to get rid of Depretiation warnings. Maybe Change back someday
gem 'authlogic', :git => 'git://github.com/odorcicd/authlogic.git', :branch => 'rails3'
gem 'rails3-generators'
gem "haml"
gem "RedCloth"
gem 'heroku'
group :production do
	# mysql2 for use in Production env on EngineYard AppCloud
	gem "mysql2"
end

group :test, :development do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem "rspec-rails", "~> 2.2.1"
  gem "factory_girl", :branch => 'rails3'
  gem 'factory_girl_rails'
end

