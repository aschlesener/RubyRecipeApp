class AddUnitToRecipeIngredient < ActiveRecord::Migration
  def change
    add_reference :recipe_ingredients, :unit, index: true, foreign_key: true
  end
end
