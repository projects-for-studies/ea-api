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
    user = User.find_by(id: adress_params[:user_id])
    if !user.nil?
      adress = Adress.create!({ city: adress_params[:city], state: adress_params[:state], district: adress_params[:district], street: adress_params[:street], number: adress_params[:number], zip_code: adress_params[:zip_code], complement: adress_params[:complement], reference: adress_params[:reference] })
      if adress
        user.adress_id = adress.id
        user.save
        render json: { data: "Endereço cadastrado com sucesso.", success: true }
      else
        render json: { data: "Erro ao cadastrar endereço.", success: false }
      end
    else
      render json: { data: "Usuário não existe.", success: false }
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
      params.permit(:user_id, :city, :state, :district, :zip_code, :number, :street, :complement, :reference)
    end
end
