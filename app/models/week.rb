class Week < ApplicationRecord
  has_many :availabilities
  has_many :shifts

  validates :start_date, presence: true
  validates :end_date, presence: true
end
