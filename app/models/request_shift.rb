class RequestShift < ApplicationRecord
  validates :worked_on, presence: true
  validates :worked_at, presence: true
  validates :work_job, presence: true
end
