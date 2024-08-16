class Week < ApplicationRecord
  has_many :availabilities
  has_many :shifts

  validates :start_date, presence: true
  validates :end_date, presence: true

  def number_and_year
    week_number = start_date.strftime('%U').to_i + 1
    "Semana #{week_number} del #{start_date.year}"
  end

  def days
    (start_date..end_date).to_a
  end
end
