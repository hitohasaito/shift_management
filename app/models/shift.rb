class Shift < ApplicationRecord
  has_many :assigned_works, dependent: :destroy
  has_many :users, through: :assigned_works, source: :user, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :duty_on, presence: true
  validates :started_at, presence: true
  validates :end_at, presence: true
  validates :job, presence: true

  enum status:{nonreleased: 0, released: 1}

  def match_days(requests, shift)
    days = requests.pluck(:worked_on)
    find_day = days.grep(shift.duty_on)
    match_request_days = RequestShift.where(worked_on: find_day)
    day_match_users = match_request_days.pluck(:id)
  end

  def match_times(shift)
    match_request_times = RequestShift.where("start_work_at <= ? ", shift.started_at).where("end_work_at <= ? ", shift.end_at)
    match_time_users = match_request_times.pluck(:id)
  end
#勤務希望開始時間よりも、シフト開始時間の方が遅い
  def match_jobs(requests, shift)
    do_works = requests.pluck(:work_job)
    find_works = do_works.grep(shift.job)
    match_request_jobs = RequestShift.where(work_job: find_works)
    job_match_users = match_request_jobs.pluck(:id)
  end

end
