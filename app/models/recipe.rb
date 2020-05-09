class Recipe < ActiveRecord::Base
  has_many :ingredients 
  accepts_nested_attributes_for :ingredients

  def recipe_title= (tile)
    self.recipe = Recipe.find_or_create_by(title: title)
  end

  def recipe_title
    self.recipe ? self.recipe.title : nil
  end
end
