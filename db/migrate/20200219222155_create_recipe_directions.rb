class CreateRecipeDirections < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_directions do |t|
      t.integer :recipe_id
      t.integer :direction_id

      t.timestamps
    end
  end
end
