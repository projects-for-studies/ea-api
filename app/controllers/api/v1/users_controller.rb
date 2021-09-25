class Api::V1::UsersController < ApplicationController
  before_action :set_user, :authenticate_api_user!, only: [:show, :update, :update_address]

  def show
    if !@user.nil?
      address = Adress.find_by(id: @user.adress_id)
      render json: {user: @user, address: address}
    end
  end

  def update
    if !params[:name].empty? && !params[:email].empty? && !params[:gender].empty? && !params[:date_birth].empty? && !params[:telephone_1].empty?
      if @user.update({ name: params[:name], email: params[:email], gender: params[:gender], date_birth: params[:date_birth], telephone_1: params[:telephone_1], telephone_2: params[:telephone_2] })
        render json: { user: @user, status: 'success' }
      else
        render json: { user: nil, status: 'error' }
      end
    else
      render json: { user: @user, status: 'error' }
    end
  end

  def update_address
    if @user.nil?
      render json: { data: "Usuário não existe.", status: "error" }
      return
    end

    if !@user.adress_id.nil?
      address = Adress.find_by(id: @user.adress_id)
      if address.nil?
        render json: { data: "Usuário não possui endereço cadastrado.", status: "error"  }
        return
      end

      if params[:city].empty? || params[:state].empty? || params[:district].empty? || params[:street].empty? || params[:zip_code].empty? || params[:number].empty?
        render json: { data: "Campos obrigatórios estão vazios.", status: "error"  }
        return
      end

      if address.update({ city: params[:city], state: params[:state], district: params[:district], zip_code: params[:zip_code], number: params[:number], street: params[:street], complement: params[:complement], reference: params[:reference] })
        render json: { data: address, status: "success" }
        return
      else
        render json: { data: "Ocorreu um erro ao atualizar o endereço.", status: "error" }
        return
      end
    else
      render json: { data: "Usuário não possui endereço cadastrado.", status: "error" }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
