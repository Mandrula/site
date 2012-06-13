source 'http://rubygems.org'

gem 'sinatra',           require: "sinatra/base"
gem 'sinatra-support',   require: "sinatra/support"
gem 'sinatra-contrib',   require: "sinatra/contrib"
gem 'sinatra-assetpack', require: "sinatra/assetpack"

# Template engines
gem 'compass'
gem 'haml'
gem 'sass'

# JS Compression
gem "jsmin"

group :development, :test do
  gem 'faker'
  gem 'thin'
end

group :test do
  gem 'minitest'
  gem 'capybara'
  gem 'launchy'
  gem 'turn', :require => false
end

group :production do
  gem 'unicorn'
  gem 'therubyracer-heroku'
end
