require 'deep_cloneable'

module DietBlock
  class DietsController < ::ApplicationController
    def index
      @user = current_user.staff? ? User.find(params[:user_id]) : current_user
      if params[:maintenance]
        @diets = @user.diets.where('`order` > ?', Settings.diets.last_week)
      else
        @diets = @user.diets
      end

      respond_with(@diets)
    end

    def new
      @user = User.find(params[:user_id])
      if !@user.meal_plan
        flash[:error] = 'This user has not given us their diet restrictions yet.'
        return redirect_to action: :index
      end
      if @user.diets.present?
        @diet = @user.diets.order('`order` DESC').first.dup(include: :meals)
        @diet.order += 1
      else
        @diet = Diet.new(order: Diet.default_order)
      end
      meal_types = @user.meal_plan.meal_types.includes(:meal_aspects)
      meal_types.each do |mt|
        mt.meal_aspects.each do |ma|
          unless @diet.meals.any? { |m| m.meal_type_id === mt.id && m.meal_aspect_id === ma.id }
            @diet.meals.build(
              meal_type_id: mt.id,
              meal_aspect_id: ma.id,
            )
          end
        end
      end

      respond_with(@diet)
    end

    def create
      @user = User.find(params[:user_id])
      @diet = @user.diets.build(params[:diet])
      @diet.save

      respond_with(@diet) do |format|
        format.html { redirect_to user_diets_path(@diet.user) }
     end
    end

    def edit
      @user = User.find(params[:user_id])
      @diet = @user.diets.find(params[:id])

      respond_with(@diet)
    end

    def update
      @diet = Diet.find(params[:id])
      @diet.update_attributes(params[:diet])

      respond_with(@diet) do |format|
        format.html { redirect_to user_diets_path(@diet.user) }
     end
    end

    def destroy
      @diet = Diet.find(params[:id])
      @diet.destroy

      respond_with(@diet) do |format|
        format.html { redirect_to user_diets_path(@diet.user) }
     end
    end
  end
end