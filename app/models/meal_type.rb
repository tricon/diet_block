class MealType < ActiveRecord::Base
  has_many :meal_type_aspects
  has_many :meal_aspects, :through => :meal_type_aspects
  has_many :meal_plan_types
  has_many :meal_plans, :through => :meal_plan_types

  validates_presence_of :title, :message => "can't be blank"
  validates_presence_of :name, :message => "can't be blank"
end
