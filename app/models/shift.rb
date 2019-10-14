class Shift < ApplicationRecord

  validates :duty_on, presence: true
  validates :duty_at, presence: true
  validates :job, presence: true
end
