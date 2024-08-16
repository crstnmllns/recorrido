class Service < ApplicationRecord
  has_many :availabilities
  has_many :shifts

  validates :name, presence: true

  def contract_hours
    (contract_start_time.to_i...contract_end_time.to_i).step(1.hour).map { |t| Time.at(t).utc.strftime('%H:%M') }
  end
end
