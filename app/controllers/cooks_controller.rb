class CooksController < ApplicationController
  before_action :set_cook, only: %i[ show edit update destroy ]

  # GET /cooks
  def index
    @cooks = Cook.all
  end

  # GET /cooks/1
  def show
  end

  # GET /cooks/new
  def new
    @cook = Cook.new
  end

  # GET /cooks/1/edit
  def edit
  end

  # POST /cooks
  def create
    @cook = Cook.new(cook_params)

    if @cook.save
      redirect_to @cook, notice: "Cook was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cooks/1
  def update
    if @cook.update(cook_params)
      redirect_to @cook, notice: "Cook was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cooks/1
  def destroy
    @cook.destroy
    redirect_to cooks_url, notice: "Cook was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cook
      @cook = Cook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cook_params
      params.require(:cook).permit(:first_name, :meal_id)
    end
end
