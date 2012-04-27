class MealPlanType < ActiveRecord::Base
  belongs_to :meal_plan
  belongs_to :meal_type
end
