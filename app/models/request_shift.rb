class RequestShift < ApplicationRecord
  belongs_to :user

  validates :worked_on, presence: true
  validates :start_work_at, presence: true
  validates :end_work_at, presence: true
  validates :work_job, presence: true
end
