class RecipeDirection < ApplicationRecord
    belongs_to :recipe 
    belongs_to :direction
end
