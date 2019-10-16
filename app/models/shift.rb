class Shift < ApplicationRecord
  has_many :assigned_works
  has_many :users, through :assigned_works, source: :user

  validates :duty_on, presence: true
  validates :duty_at, presence: true
  validates :job, presence: true
end
