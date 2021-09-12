class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index;end

  # GET /users/1
  def show;end

  # POST /users
  def create;end

  # PATCH/PUT /users/1
  def update;end

  # DELETE /users/1
  def destroy;end
end
