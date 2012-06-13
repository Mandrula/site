# Load dependencies.
require "bundler"
Bundler.require :default, ENV['RACK_ENV'].to_sym

class Mandrula < Sinatra::Base
  # Set the root path for the project.
  set :root, lambda { |*args| File.join(File.dirname(__FILE__), *args) }

  # Set the views path.
  set :views, root('app', 'views')

  # Always raise errors.
  enable :raise_errors

  # Development specific configuration.
  configure :development do
    register Sinatra::Reloader

    enable :show_exceptions
  end

  # Configure haml.
  set :haml, :layout => :layout, :format => :html5

  # Enable Compass Support.
  register Sinatra::CompassSupport

  # Configure the assets pipeline.
  register Sinatra::AssetPack

  assets do
    # The second parameter defines where the compressed version will be served.
    js :app, '/js/app.js', [
      '/js/vendor/**/*.js',
      '/js/app/**/*.js'
    ]

    css :application, ['/css/*.css']

    prebuild true
  end
end

# Require application files.
['./routes/**/*.rb'].sort.each do |path|
  Dir[path].sort.each { |file| require file }
end
