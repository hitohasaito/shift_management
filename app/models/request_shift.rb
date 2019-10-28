class RequestShift < ApplicationRecord
  belongs_to :user

  validates :worked_on, presence: true
  validates :start_work_at, presence: true
  validates :end_work_at, presence: true
  validates :work_job, presence: true
  validate :time_check
  validate :date_cannot_be_in_the_past, on: :create

  def time_check
    errors.add(:end_work_at, "が不正です") unless
    self.start_work_at < self.end_work_at
  end

  def date_cannot_be_in_the_past
    if worked_on.present? && worked_on < Date.today
      errors.add(:worked_on, ": 過去の日付は使用できません")
    end
  end

end
