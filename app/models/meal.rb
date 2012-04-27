class Meal < ActiveRecord::Base
  belongs_to :diet
  belongs_to :meal_type
  belongs_to :meal_aspect
end
