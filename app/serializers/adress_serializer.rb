class AdressSerializer < ActiveModel::Serializer
  attributes :id, :city, :state, :district, :street, :number, :zip_code, :reference, :complement
end
