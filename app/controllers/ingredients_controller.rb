class IngredientsController < ApplicationController
  def index
    if params[:name]
      @recipes = Recipe.joins(:ingredients).where("ingredients.name LIKE ?", "#{params[:name]}")
    else
      @recipes = Recipe.all
    end
    render :recipes
  end
end

