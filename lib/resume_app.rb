require 'sinatra/base'
require 'sinatra/contrib'
require 'json'
require 'haml'
require 'yaml'

class ResumeApp < Sinatra::Base
  register Sinatra::Contrib
  helpers Sinatra::Cookies
  helpers Sinatra::JSON
  helpers Sinatra::Streaming

  set :server, :thin
  set :run, true

  set :port, 80
  set :sessions, true
  set :json_encoder, :to_json


  get '/' do
    "Hello There"
  end
end
