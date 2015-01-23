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
  movies_with_poster= []
  searched.movies.each do |movie|
    if movies_with_poster.length<9 && movie.poster != nil
      movies_with_poster.push(movie)
    end
  end

  @movies=movies_with_poster

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