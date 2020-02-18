class RecipesController < ApplicationController
    before_action :set_user, only: [:show, :edit]

    def index
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
    end

    def create 
        @recipe = Recipe.create(recipe_params)
    end

    def edit
       
    end

    def update
    
    end

    private

    def recipe_params
        params.require(:item).permit(
            :name,
            :description,
            recipe_ids:[]
        )
    end

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end
end