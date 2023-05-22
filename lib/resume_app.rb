require 'sinatra/base'
require 'sinatra/contrib'
require 'json'
require 'haml'
require 'yaml'
require 'haml_helpers'

class ResumeApp < Sinatra::Base
  register Sinatra::Contrib
  helpers Sinatra::Cookies
  helpers Sinatra::JSON
  helpers Sinatra::Streaming

  set :server, :thin
  set :run, true
  set :views, File.join(File.dirname(__FILE__), "..", "views")
  set :public_dir, File.join(File.dirname(__FILE__), "..", "public")
  set :port, 80
  set :sessions, true
  set :json_encoder, :to_json
  set :haml, { escape_html: false }

  def initialize
    super
    @app = YAML.load_file(File.join(File.dirname(__FILE__),"..", "config", "app.yaml"))
  end 
 
  def app
    @app.dup
  end

  def get_view(name)
    File.join(settings.views, "#{name}.haml")
  end

  get '/' do
    app_vars = app
    app_vars[:content]=get_view(:index)
    haml :page, :locals=> app_vars
  end

  get '/:page_name' do
    app_vars = app
    app_vars[:content]=get_view(params[:page_name])
    haml :page, :locals=> app_vars
  end
end
