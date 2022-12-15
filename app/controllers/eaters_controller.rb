class EatersController < ApplicationController
  before_action :set_eater, only: %i[ show edit update destroy ]

  # GET /eaters
  def index
    @eaters = Eater.all
  end

  # GET /eaters/1
  def show
  end

  # GET /eaters/new
  def new
    @eater = Eater.new
  end

  # GET /eaters/1/edit
  def edit
  end

  # POST /eaters
  def create
    @eater = Eater.new(eater_params)

    if @eater.save
      redirect_to @eater, notice: "Eater was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /eaters/1
  def update
    if @eater.update(eater_params)
      redirect_to @eater, notice: "Eater was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /eaters/1
  def destroy
    @eater.destroy
    redirect_to eaters_url, notice: "Eater was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eater
      @eater = Eater.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def eater_params
      params.require(:eater).permit(:first_name, :member_id, :meal_id)
    end
end
