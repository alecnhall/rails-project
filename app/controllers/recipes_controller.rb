class RecipesController < ApplicationController
    before_action :set_user, only: [:show, :edit]

    def index
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
    end

    def create 
      
    end

    def edit
       
    end

    def update
    
    end

    private

    def recipe_params
        params.require(:item).permit(
            :name,
            :amount
        )
    end

    def set_recipe
        @user = User.find(params[:id])
    end
end