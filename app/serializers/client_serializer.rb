class ClientSerializer < ActiveModel::Serializer
  attributes :id, :address, :name, :surname, :phone, :email, :num_document, :parking_id
end