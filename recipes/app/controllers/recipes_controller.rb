class RecipesController < ApplicationController
	def index
		@recipes = Recipe.all
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def new
	end

	def create
		@recipe = Recipe.new(recipe_params)

		@recipe.save
		redirect_to @recipe
	end

	private
		def recipe_params
			params.require(:recipe).permit(:name, :directions)
		end
end
