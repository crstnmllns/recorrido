class Availability < ApplicationRecord
  belongs_to :user
  belongs_to :service
  belongs_to :week

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :available, inclusion: { in: [true, false] }
end
