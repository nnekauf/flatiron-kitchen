class RecipesController < ApplicationController

    def new
        @recipe = Recipe.new
        @recipe.ingredients.build
        # @ingredients = @recipe.ingredients.select{|m| m.user_id == current_user.id}
    end

    def create
        # binding.pry
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
        # @recipe.ingredients.each {|i| i.}
            redirect_to recipe_path(@recipe)
        else
            render :new
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
      end

    def update
        @recipe = Recipe.find(params[:id])
        @recipe.update(recipe_params)
        redirect_to @recipe
    end
   

    def show
        @recipe = Recipe.find(params[:id])
        @ingredients = @recipe.ingredients
    end

    private
    def recipe_params
        params.require(:recipe).permit!#(:name, :ingredients, ingredients_attributes: [:ingredient_ids, :name, :id])
    end
end
