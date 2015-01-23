require 'imdb'
require 'awesome_print'
require 'sinatra'
require 'sinatra/reloader' if development?




get '/' do 
  erb :imdb_home
end







get '/trivia' do
   erb :trivia_submit
  

end


post '/results' do 
  
  searched=Imdb::Search.new(params[:trivia_search])
  @movie_sample=searched.movies.sample(9)
  erb :results
  
end