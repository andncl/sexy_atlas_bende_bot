class MealsController < ApplicationController
  before_action :set_meal, only: %i[ show edit update destroy ]

  # GET /meals
  def index
    @meals = Meal.all
  end

  # GET /meals/1
  def show
  end

  # GET /meals/new
  def new
    @meal = Meal.new
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals
  def create
    @meal = Meal.new(meal_params)

    if @meal.save
      redirect_to @meal, notice: "Meal was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /meals/1
  def update
    if @meal.update(meal_params)
      redirect_to @meal, notice: "Meal was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /meals/1
  def destroy
    @meal.destroy
    redirect_to meals_url, notice: "Meal was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meal_params
      params.require(:meal).permit(:name, :opening_time, :closing_time, :price)
    end
end
