class MealPlan < ActiveRecord::Base
  has_many :meal_plan_types
  has_many :meal_types, :through => :meal_plan_types
  has_many :user_meal_plans
  has_many :users, :through => :user_meal_plans
end
