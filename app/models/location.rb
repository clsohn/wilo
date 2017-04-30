class Location < ApplicationRecord
  validates :zip, presence: true, numericality: true, length: { is: 5 }

  has_many :users
end
