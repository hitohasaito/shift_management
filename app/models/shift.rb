class Shift < ApplicationRecord
  has_many :assigned_works, dependent: :destroy
  has_many :users, through: :assigned_works, source: :user, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :duty_on, presence: true
  validates :started_at, presence: true
  validates :end_at, presence: true
  validates :job, presence: true



  # def work_day
  #   shift = Shift.find(params[:id])
  #   request = RequestShift.all

  def match_days(requests, shift)
    days = requests.pluck(:worked_on)
    find_day = days.grep(shift.duty_on)
    match_request_days = RequestShift.where(worked_on: find_day)
    day_match_users = match_request_days.pluck(:user_id, :created_at)
  end

  def match_times(shift)
    match_request_times = RequestShift.where("start_work_at =< ? ", shift.started_at) && RequestShift.where("end_work_at >= ? ", shift.end_at)
    match_time_users = match_request_times.pluck(:user_id, :created_at)
  end

  def match_jobs(requests, shift)
    do_works = requests.pluck(:work_job)
    find_works = do_works.grep(shift.job)
    match_request_jobs = RequestShift.where(work_job: find_works)
    job_match_users = match_request_jobs.pluck(:user_id, :created_at)
  end
end
