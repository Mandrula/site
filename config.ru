ENV['RACK_ENV'] ||= 'development'

require "./init.rb"

Mandrula.set :run, false

run Mandrula
