require 'imdb'
require 'awesome_print'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'

get '/' do 
  erb :imdb_home
end

get '/trivia' do
   erb :trivia_submit
end

post '/results' do
  searched = Imdb::Search.new(params[:trivia_search])
  @movies=searched.movies.sample(9)
  #binding.pry
  erb :results
end

#post '/results' do
#  searched = Imdb::Search.new(params[:trivia_search])
#  movie_sample=searched.movies.sample(9)
#  @posters=movie_sample.map  do  |movie|
#    movie.poster
#  end
#  erb :results
#end