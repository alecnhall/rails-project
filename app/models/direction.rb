class Direction < ApplicationRecord
    has_one :recipe, through: :recipe_directions
    has_many :recipe_directions
end
