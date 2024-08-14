class Service < ApplicationRecord
  has_many :availabilities
  has_many :shifts

  validates :name, presence: true
end
