class ParkingSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone, :quota
end