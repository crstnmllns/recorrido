class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :availabilities
  has_many :shifts

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true

  ROLES = %w[admin ingeniero]

  def admin?
    role == 'admin'
  end

  def ingeniero?
    role == 'ingeniero'
  end

  def available_for_shift?(shift)
    availabilities.where(
      start_time: shift.start_time,
      end_time: shift.end_time,
      available: true
    ).exists?
  end

  def assigned_hours
    shifts.sum { |shift| shift.duration_in_hours }
  end
end
