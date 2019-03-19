class Tariff < ApplicationRecord
  validates :name, presence: true
  validates :value, presence: true
  has_many :tickets
end
