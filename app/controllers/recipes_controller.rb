class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]

    def index
        if params[:user_id]
            @recipes = User.find(params[:user_id]).recipes  
        elsif !params[:date].blank?
            if params[:date] == "Latest Recipes"
                @recipes = Recipe.latest
            else
                @recipes = Recipe.old
            end
        else
            @recipes = Recipe.all 
        end
    end

    def new
        @recipe = Recipe.new(user_id: params[:user_id])
        3.times { @recipe.ingredients.build }
        3.times { @recipe.directions.build }
    end

    def create 
        @recipe = Recipe.new(recipe_params)
        if @recipe.valid?
            @recipe.save
            redirect_to user_recipe_path(@recipe.user, @recipe)
        else 
            render :new
        end
    end

    def show
        
    end

    def edit
       
    end

    def update
        @recipe.update(recipe_params)
        if @recipe.save
            redirect_to user_recipe_path(@recipe.user, @recipe)
        else 
            redirect_to edit_user_recipe_path(@recipe)
        end
    end

    def destroy
        @recipe.destroy
        redirect_to root_url
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :description, :user_id,
            ingredients_attributes: [:name, :amount, :_destroy],
            directions_attributes: [:step, :_destroy] 
        )
    end

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end
end