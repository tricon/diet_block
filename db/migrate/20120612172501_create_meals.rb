class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :value
      t.references :diet, :meal_type, :meal_aspect

      t.timestamps
    end
  end
end
