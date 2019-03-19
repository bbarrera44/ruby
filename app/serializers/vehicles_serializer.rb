class VehiclesSerializer < ActiveModel::Serializer
  attributes :id, :plate, :state, :id_client
end