class Diet < ActiveRecord::Base
  default_scope order("diets.order DESC")

  belongs_to :user

  has_many :meals, dependent: :destroy
  has_many :meal_aspects, through: :meals

  accepts_nested_attributes_for :meals, allow_destroy: true, reject_if: proc { |attrs| attrs['value'].blank? }

  validates_presence_of :order, :message => "can't be blank"


  def self.default_order
    Settings.diets.first_week
  end

  def self.before(diet)
    where(order: diet.order - 1).first
  end

  def begin_day
    (order - 1) * Settings.programs.days_in_week + 1
  end

  def end_day
    if order >= Settings.diets.last_week
      90
    else
      order * Settings.programs.days_in_week
    end
  end

  def title
    case order
    when Settings.diets.first_week..Settings.diets.last_week
      "Week #{order}"
    when Settings.diets.active_diet_week
      'Active Life Maintenance Diet'
    when Settings.diets.sedentary_diet_week
      'Sedentary Maintenance Diet'
    end
  end
end
