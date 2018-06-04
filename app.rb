require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative 'cookbook.rb'
require_relative 'recipe.rb'



configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  @cookbook = Cookbook.new("recipes.csv")
  @recipes = @cookbook.all
  erb :index
end

get '/new' do
  erb :new
end

post '/new' do
  @cookbook = Cookbook.new("recipes.csv")
  #binding.pry
  @recipes = @cookbook.all
  @cookbook.add_recipe(Recipe.new(params[:recipe_name],params[:recipe_description], params[:recipe_preptime], params[:recipe_difficulty], false))
  redirect '/'
end

get '/destroy/:id' do
  #binding.pry
  @cookbook = Cookbook.new("recipes.csv")
  @recipes = @cookbook.all
  @cookbook.remove_recipe(params[:id].to_i)
  redirect '/'
end

get '/about' do
  erb :about
end




# get '/' do
#   .. show something ..
# end

# post '/' do
#   .. create something ..
# end

# put '/' do
#   .. replace something ..
# end

# patch '/' do
#   .. modify something ..
# end

# delete '/' do
#   .. annihilate something ..
# end

# options '/' do
#   .. appease something ..
# end

# link '/' do
#   .. affiliate something ..
# end

# unlink '/' do
#   .. separate something ..
# end
