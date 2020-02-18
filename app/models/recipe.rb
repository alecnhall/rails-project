class Recipe < ApplicationRecord
    validates :name, presence: true
    belongs_to :user
    has_many :comments
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    accepts_nested_attributes_for :ingredients
    accepts_nested_attributes_for :recipe_ingredients
end
