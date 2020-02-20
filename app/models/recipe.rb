class Recipe < ApplicationRecord
    validates :name, presence: true
    belongs_to :user
    has_many :comments
    has_many :recipe_ingredients
    has_many :users, through: :comments
    has_many :ingredients, through: :recipe_ingredients
    has_many :recipe_directions
    has_many :directions, through: :recipe_directions

    accepts_nested_attributes_for :directions, allow_destroy: true
    accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: lambda { |attributes| attributes['name'].blank? }

end
