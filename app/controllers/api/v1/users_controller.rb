class Api::V1::UsersController < ApplicationController
  before_action :set_user, :authenticate_api_user!, only: [:show]

  def show
    if !@user.nil?
      address = Adress.find_by(id: @user.adress_id)
      render json: {user: @user, address: address}
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
