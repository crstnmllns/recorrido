class ChangeLog < ApplicationRecord
  belongs_to :user
  belongs_to :shift

  validates :change_description, presence: true
end
