class TicketSerializer < ActiveModel::Serializer
  attributes :id, :entry_tine, :departure_time, :tariff_id, :vehicle_id
end