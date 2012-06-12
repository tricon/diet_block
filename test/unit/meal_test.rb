require 'test_helper'

class MealTest < ActiveSupport::TestCase
  def test_meal_type_id_required
    meal = Meal.new
    meal.save

    assert meal.errors[:meal_type_id].present?
  end
end