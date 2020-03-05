class Item < ApplicationRecord
    validates :name, presence: { message: "must be present" }
    belongs_to :pantry
end
