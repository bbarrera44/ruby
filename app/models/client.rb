class Client < ApplicationRecord
  validates :address, presence: true
  validates :name, presence: true
  validates :surname, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :num_document, presence: true
  validates :parking_id, presence: true

  belongs_to :parking
  has_many :vehicles


  def show_parking
    Parking.all
  end
end
