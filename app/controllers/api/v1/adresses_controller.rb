class Api::V1::AdressesController < ApplicationController
  before_action :set_adress, only: [:show, :update, :destroy]

  # GET /adresses
  def index
    @adresses = Adress.all

    render json: @adresses
  end

  # GET /adresses/1
  def show
    render json: @adress
  end

  # POST /adresses
  def create
    @adress = Adress.new(adress_params)

    if @adress.save
      render json: @adress, status: :created, location: @adress
    else
      render json: @adress.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /adresses/1
  def update
    if @adress.update(adress_params)
      render json: @adress
    else
      render json: @adress.errors, status: :unprocessable_entity
    end
  end

  # DELETE /adresses/1
  def destroy
    @adress.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adress
      @adress = Adress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adress_params
      params.require(:adress).permit(:city, :state, :zip_code, :street, :district, :number, :complement, :reference)
    end
end
