require "compass"
require "sinatra/base"
require "sinatra/reloader"

class Mandrula < Sinatra::Base
  # Set the root path for the project.
  set :root, lambda { |*args| File.join(File.dirname(__FILE__), *args) }

  # Set the views path.
  set :views, root('views')

  # Set the public directory.
  set :public_folder, root("public")

  # Serve static files from the public directory.
  set :static, true

  # Enable session support.
  set :sessions, true

  # Development specific configuration.
  configure :development do
    register Sinatra::Reloader
  end

  # Configure haml.
  set :haml, :layout => :layout, :ugly => true, :format => :html5

  # Configure Compass/Sass
  configure do
    Compass.configuration do |config|
      config.sass_dir        = 'views/sass'
      config.css_dir         = 'public/css'
      config.javascripts_dir = 'public/js'
      config.images_dir      = 'public/images'
      config.output_style    = development? ? :expanded : :compressed
    end

    set :sass, Compass.sass_engine_options
  end

  get '/css/:name.css' do |name|
    content_type 'text/css', :charset => 'utf-8'
    sass :"sass/#{name}"
  end
end

# Require application files.
['./routes/**/*.rb'].each do |path|
  Dir[path].sort.each { |file| require file }
end
