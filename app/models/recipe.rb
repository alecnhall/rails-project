class Recipe < ApplicationRecord
    validates :name, presence: { message: "must be present" }
    belongs_to :user
    has_many :recipe_ingredients
    has_many :users, through: :comments
    has_many :ingredients, through: :recipe_ingredients
    has_many :recipe_directions
    has_many :directions, through: :recipe_directions

    accepts_nested_attributes_for :directions, allow_destroy: true
    accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: lambda { |attributes| attributes['name'].blank? }

    def self.latest
        where("created_at >=?", Time.zone.today.beginning_of_day)
    end
       
    def self.old
        where("created_at <?", Time.zone.today.beginning_of_day)
    end
end


