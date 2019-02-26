require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

configure do
  enable :sessions
  set :session_secret, 'secret'
  set :erb, escape_html: true
end

before do
  # load path to YAML file
end

def flights_path
  File.expand_path('../data/flights.yml', __FILE__)
end

def load_flights
  # Psych.dump(flights_path)
  Psych.load_file(flights_path)
end

def add_flight
  # write flight to YAML file
end

def delete_flight
  # remove specified entry from YAML file
end

def proper_case!(name)
  name.split.map(&:capitalize).join(' ')
end

get '/' do
  erb :home
end

get '/new' do
  erb :new
end

post '/flights' do
  airline = proper_case!(params[:airline])
  flight_number = params[:flight_number]
  destination = proper_case!(params[:destination])
  time = "#{params[:hour]}: #{params[:minute]}"
  @flights = load_flights
  erb :flights
end
