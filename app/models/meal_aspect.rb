class MealAspect < ActiveRecord::Base
  belongs_to :meal_type
  belongs_to :meal
end
