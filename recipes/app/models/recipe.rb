class Recipe < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :ingredients, :through => :recipe_ingredients

	validates :name, presence: true, length: {minimum: 2}
end
