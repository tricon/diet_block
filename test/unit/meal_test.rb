require 'test_helper'

class MealTest < ActiveSupport::TestCase
  def test_meal_type_id_required
    meal = Meal.new
    meal.save

    assert meal.errors[:meal_type_id].present?
  end

  def test_meal_aspect_id_required
    meal = Meal.new
    meal.save

    assert meal.errors[:meal_aspect_id].present?
  end

  def test_meal_type_id_format
    meal = Meal.new
    meal.meal_type_id = 'q'
    meal.save

    assert meal.errors[:meal_type_id].present?
  end

  def test_meal_aspect_id_format
    meal = Meal.new
    meal.meal_type_id = 1
    meal.meal_aspect_id = 'q'
    meal.save

    assert meal.errors[:meal_aspect_id].present?
  end
end