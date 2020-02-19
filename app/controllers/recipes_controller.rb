class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update]

    def index
        if params[:user_id]
            @recipes = User.find(params[user_id]).posts
        else
            @recipes = Recipe.all 
        end
    end

    def new
        if params[:user_id] && !User.exists?(params[:user_id])
            redirect_to users_path, alert: "User not found."
          else
            @recipe = Recipe.new(user_id: params[:user_id])
          end
    end

    def create 
        @recipe = Recipe.create(recipe_params)
        raise.recipe_params
        @recipe.save
        redirect_to user_recipe_path(@recipe, @recipe.user)
    end

    def show
    end

    def edit
       
    end

    def update
    
    end

    private

    def recipe_params
        params.require(:recipe).permit(
            :name,
            :description,
            :user_id,
            ingredients_attributes:[:id, :name, :amount],
        )
    end

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end
end