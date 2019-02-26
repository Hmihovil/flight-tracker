require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

configure do
  enable :sessions
  set :session_secret, 'secret'
  set :erb, escape_html: true
end

before do
  session[:flights] ||= {}
  @flights = session[:flights]
end

def new_max
  max = @flights.keys.max
  max = max.nil? ? 1 : max.succ
end

def add_flight!(airline, flight, destination, time)
  @flights[new_max] = { airline: "#{airline}",
                        flight: "#{flight}",
                        destination: "#{destination}",
                        time: "#{time}"
                      }
end

def delete_flight!(id)
  @flights.delete(id)
  if @flights[id]
    session[:message] = 'Flight NOT deleted.'
  else
    session[:message] = 'Flight successfully deleted.'
  end
end

def proper_case!(name)
  name.split.map(&:capitalize).join(' ')
end

get '/' do
  erb :flights
end

get '/new' do
  erb :new
end

get '/flights' do
  redirect '/'
end

post '/flights' do
  airline = proper_case!(params[:airline])
  flight = params[:flight_number]
  destination = proper_case!(params[:destination])
  time = "#{params[:hour]}:#{params[:minute]}"
  add_flight!(airline, flight, destination, time)
  session[:message] = 'Flight successfully added.'
  redirect '/'
end

post '/delete/:id' do
  id = params[:id].to_i
  if id.nil?
    session[:message] = "That flight doesn't exist."
    erb :flights
  else
    delete_flight!(id)
    redirect '/'
  end
end
