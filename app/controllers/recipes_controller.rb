class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    
  end

  def create
    @recipe = Recipe.new(recipe_params)
    redirect_to recipes_path
  end


  private

  def recipe_params
    params.require(:recipe).permit(:title, 
      ingredients_attribute: [
      :recipe_ingredients_attributes_0_name, 
      :recipe_ingredients_attributes_0_content, 
      :recipe_ingredients_attributes_1_name, 
      :recipe_ingredients_attributes_1_content]
    )
  end
end
