source 'http://rubygems.org'

gem 'sinatra'
gem 'sinatra-contrib'

# Template engines
gem 'compass'
gem 'haml'
gem 'sass'

group :development, :test do
  gem 'faker'
  gem 'thin'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'ansi'
  gem 'minitest'
  gem 'turn', :require => false
end

group :production do
  gem 'unicorn'
  gem 'therubyracer-heroku'
end
