require 'csv'
require_relative 'recipe.rb'

class Cookbook
  attr_accessor :recipes
  def initialize(csv_file_path)
    @recipes = []
    @csv = csv_file_path
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    # add a recipe to array
    @recipes << recipe
    update_csv
  end

  def remove_recipe(recipe_index)
    # remove recipe from array
    @recipes.delete_at(recipe_index)
    update_csv
  end

  def update_csv
    CSV.open(@csv, 'wb') do |row|
      @recipes.each do |recipe| # each recipe is an object
        row << [recipe.name, recipe.description, recipe.prep_time, recipe.difficulty, recipe.status]
      end
      # pick object1, call "name" method + same object, call description method
    end
  end

  def load_csv
    CSV.foreach(@csv) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2], row[3], row[4])
    end
  end
end




