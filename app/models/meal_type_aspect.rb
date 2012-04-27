class MealTypeAspect < ActiveRecord::Base
  belongs_to :meal_type
  belongs_to :meal_aspect
end
