class Vehicle < ApplicationRecord
  validates :plate, presence: true
  validates :state, presence: true
  validates :client_id, presence: true

  has_many :tickets
  belongs_to :client



  def show_clients
    Client.all
  end



end
