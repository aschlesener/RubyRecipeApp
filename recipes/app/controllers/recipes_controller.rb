class RecipesController < ApplicationController
	def new
	end

	def create
		render plain: params[:recipe].inspect
	end
end
