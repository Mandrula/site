ENV['RACK_ENV'] ||= 'development'

require "./app.rb"

Mandrula.set :run, false

run Mandrula
