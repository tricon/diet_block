class Meal < ActiveRecord::Base
  belongs_to :diet
  belongs_to :meal_type
  belongs_to :meal_aspect

  validates_presence_of :meal_type_id, :message => 'must belong to a meal type'
  validates_presence_of :meal_aspect_id, :message => 'must belong to a meal aspect'
  validates_numericality_of :meal_type_id, greater_than: 0, :message => 'must be a number greater than 0'
  validates_numericality_of :meal_aspect_id, greater_than: 0, :message => 'must be a number greater than 0'
end
