class Meal < ActiveRecord::Base
  belongs_to :diet
  belongs_to :meal_type
  belongs_to :meal_aspect

  validates_presence_of :meal_type_id, :message => 'must belong to a meal type'
  validates_presence_of :meal_aspct_id, :message => 'must belong to a meal aspect'
  validates_format_of :meal_type_id, :with => /^[\d]+$/, :message => 'must be a number'
  validates_format_of :meal_aspect_id, :with => /^[\d]+$/, :message => 'must be a number'
end
