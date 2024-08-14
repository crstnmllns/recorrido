class Shift < ApplicationRecord
  belongs_to :user
  belongs_to :service
  belongs_to :week

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :status, presence: true
end
