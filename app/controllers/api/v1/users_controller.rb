class Api::V1::UsersController < ApplicationController
  before_action :set_user, :authenticate_api_user!, only: [:show, :update, :update_address, :upload_picture, :delete_picture]

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

    if params[:city].empty? || params[:state].empty? || params[:district].empty? || params[:street].empty? || params[:zip_code].empty? || params[:number].empty?
      render json: { data: "Campos obrigatórios estão vazios.", status: "error"  }
      return
    end

    if !@user.adress_id.nil?
      address = Adress.find_by(id: @user.adress_id)

      if address.update({ city: params[:city], state: params[:state], district: params[:district], zip_code: params[:zip_code], number: params[:number], street: params[:street], complement: params[:complement], reference: params[:reference] })
        render json: { data: address, status: "success" }
        return
      else
        render json: { data: "Ocorreu um erro ao atualizar o endereço.", status: "error" }
        return
      end
    else
      address_create = Adress.create({ city: params[:city], state: params[:state], district: params[:district], zip_code: params[:zip_code], number: params[:number], street: params[:street], complement: params[:complement], reference: params[:reference] })
      @user.adress_id = address_create.id
      if @user.save && !address_create.nil?
        render json: { data: "Endereço adicionado com sucesso.", status: "success" }
      end
    end
  end

  def upload_picture
    if !@user.nil?
      FileUtils.mkdir("#{Rails.root}/public/profile_picture") unless File.exist?("#{Rails.root}/public/profile_picture")

      extension = params[:filename].original_filename.split('.')
      extension = extension[extension.length - 1]

      file_name = "profile_picture_#{@user.id}.#{extension}"
      path = File.join("#{Rails.root}/public/profile_picture", file_name)

      if !@user.photo.nil? && !@user.photo.empty?
        old_photo = File.join("#{Rails.root}/public/profile_picture", @user.photo)
        File.delete(old_photo) if File.exist?(old_photo)
        File.delete(path) if File.exist?(path)

        File.open(path, 'wb') { |f| f.write(params[:filename].read) }
        @user.photo = file_name
        @user.save
        render json: {data: file_name, status: true}
      else

        File.delete(path) if File.exist?(path)
        File.open(path, 'wb') { |f| f.write(params[:filename].read) }
        @user.photo = file_name
        @user.save
        render json: {data: file_name, status: true}
      end
    else
      render json: { data: "Usuário não existe!", status: false }
    end
  end

  def delete_picture
    if !@user.nil?
      if !@user.photo.nil? && !@user.photo.empty?
        picture = File.join("#{Rails.root}/public/profile_picture", @user.photo)
        File.delete(picture) if File.exist?(picture)
        @user.photo = ""
        @user.save
        render json: { data: "Foto apagada com sucesso!", status: true }
      else
        render json: { data: "Usuário não possui foto de perfil!", status: false }
      end
    else
      render json: { data: "Usuário não existe!", status: false }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
