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
end
