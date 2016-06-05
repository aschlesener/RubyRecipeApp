class RecipesController < ApplicationController
	def index
		@recipes = Recipe.all
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def new
		@recipe = Recipe.new
		@recipe_ingredients = @recipe.recipe_ingredients.build
		@ingredients = @recipe_ingredients.build_ingredient
	end

	def edit
		@recipe = Recipe.find(params[:id])
	end

	def create
		@recipe = Recipe.new(recipe_params)

		if @recipe.save
			redirect_to @recipe
		else
			render 'new'
		end
	end

	def update
		@recipe = Recipe.find(params[:id])

		if @recipe.update(recipe_params)
			redirect_to @recipe
		else
			render 'edit'
		end
	end

	def destroy
		@recipe = Recipe.find(params[:id])
		@recipe.destroy

		redirect_to recipes_path
	end

	private
		def recipe_params
			params.require(:recipe).permit(:name, :directions, recipe_ingredients_attributes: [:id, :recipe_id, :ingredient_id, :unit_id, :amount, :_destroy, ingredient_attributes: [:id]])
		end
end
