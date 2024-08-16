class Shift < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :service
  belongs_to :week

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :status, presence: true

  def duration_in_hours
    ((end_time - start_time) / 1.hour).round
  end
end
