class Shift < ApplicationRecord
  has_many :assigned_works
  has_many :users, through: :assigned_works, source: :user
  has_many :comments

  validates :duty_on, presence: true
  validates :started_at, presence: true
  validates :end_at, presence: true
  validates :job, presence: true
end
