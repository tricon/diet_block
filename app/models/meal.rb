class Meal < ActiveRecord::Base
  belongs_to :diet
  belongs_to :meal_type
  belongs_to :meal_aspect

  validates_presence_of :meal_type_id, :message => 'must belong to a meal type'
end
