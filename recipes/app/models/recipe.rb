class Recipe < ActiveRecord::Base
	has_many :recipe_ingredients, dependent: :destroy
	has_many :ingredients, :through => :recipe_ingredients
	accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true
	validates :name, presence: true, length: {minimum: 2}
end
