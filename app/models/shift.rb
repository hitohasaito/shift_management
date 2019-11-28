class Shift < ApplicationRecord
  include RansackerTranslator

  ransacker_translate :assigned_user
  has_many :assigned_works, dependent: :destroy
  has_many :users, through: :assigned_works, source: :user, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :duty_on, presence: true
  validates :started_at, presence: true
  validates :end_at, presence: true
  validates :job, presence: true
  validate :time_check
  validate :date_cannot_be_in_the_past, on: :create

  enum status:{released: 0,nonreleased: 1}

  def time_check
    if self.started_at.present? && self.end_at.present?
      if  self.end_at.to_s(:time) < self.started_at.to_s(:time)
        errors.add(:end_at, "が不正です")
      end
    end
  end

  def date_cannot_be_in_the_past
    if duty_on.present? && duty_on < Date.today
      errors.add(:duty_on, ": 過去の日付は使用できません")
    end
  end

  def match_days(requests, shift)
    days = requests.pluck(:worked_on)
    find_day = days.grep(shift.duty_on)
    match_request_days = RequestShift.where(worked_on: find_day)
    day_match_ids = match_request_days.pluck(:id)
  end

  def match_times(shift)
    starttime = RequestShift.pluck(:start_work_at).map{|time| time.to_s(:time)}
    startid = RequestShift.pluck(:id)
    s = startid.zip(starttime).to_h

    endtime = RequestShift.pluck(:end_work_at).map{|time| time.to_s(:time)}
    endid = RequestShift.pluck(:id)
    e = endid.zip(endtime).to_h

    start = s.find_all{|i,t| t <= shift.started_at.to_s(:time)}.to_h
    ended = e.find_all{|i,t| t >= shift.end_at.to_s(:time)}.to_h

    match_time_ids = start.keys && ended.keys
  end
#勤務希望開始時間よりも、シフト開始時間の方が遅い
  def match_jobs(requests, shift)
    do_works = requests.pluck(:work_job)
    find_works = do_works.grep(shift.job)
    match_request_jobs = RequestShift.where(work_job: find_works)
    job_match_ids = match_request_jobs.pluck(:id)
  end

  def find_and_sort_user_id(match_requests)
    match_records = RequestShift.find(match_requests)#重複しているid
    match_columns = match_records.pluck(:user_id, :created_at)#その中のuser_idと作成日付
    sort_user = match_columns.sort_by{|a, b| b }.first
    match_user_id = sort_user.first
  end

end
