class Ticket < ApplicationRecord



  belongs_to :tariff
  belongs_to :vehicle


  def show_vehicle
    Vehicle.all
  end

  def show_tariff
    Tariff.all
  end
end
