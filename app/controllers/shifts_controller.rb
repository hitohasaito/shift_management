class ShiftsController < ApplicationController
  before_action :get_id, only:[:show, :edit, :update, :destroy]
  before_action :check_user, only:[:create]

  def new
    @shift = Shift.new
    @shift.assigned_works.build
  end

  def create
    @shift = Shift.new(shift_params)
    if @shift.save
      redirect_to shifts_path
    else
      render "new"
    end
  end
  def index
    @shifts = Shift.all
    @requests = RequestShift.all

    if params[:id]
      @shift = Shift.find(params[:id])

      #勤務日にマッチしている人たちのuser_idをゲット
      day_match_users = @shift.match_days(@requests, @shift)

      # days = @requests.pluck(:worked_on)
      # find_day = days.grep(@shift.duty_on)
      # match_request_days = RequestShift.where(worked_on: find_day)
      # day_match_users = match_request_days.pluck(:user_id, :created_at)


      #勤務時間にマッチしている人たちのuser_idをゲット
      match_time_users = @shift.match_times(@shift)
      # match_request_times = RequestShift.where("start_work_at =< ? ", @shift.started_at) && RequestShift.where("end_work_at >= ? ", @shift.end_at)
      # match_time_users = match_request_times.pluck(:user_id, :created_at)

      #勤務業務にマッチしている人たちのuser_idをゲット
      job_match_users = @shift.match_jobs(@requests, @shift)
      # do_works = @requests.pluck(:work_job)
      # find_works = do_works.grep(@shift.job)
      # match_request_jobs = RequestShift.where(work_job: find_works)
      # job_match_users = match_request_jobs.pluck(:user_id,:created_at)

      #3つの配列で重複しているuser_idをゲット
      match_users = [day_match_users, match_time_users, job_match_users].inject(&:&)

      if match_users.present?
        sort_user = match_users.sort_by{|a, b| b }.first
        match_user_id = sort_user.first

        assign = @shift.assigned_works.build(user_id: match_user_id, shift_id: @shift.id)
        assign.save
        @shift.assigned_user = assign.user.name
        @shift.save
      else
        flash[:notice] = "合致する志望者がいません"
      end

      else
        @shifts = Shift.all.order(created_at: :asc)
        @requests = RequestShift.all
    end
  end

  # 17:00-21:00　シフト
  # 13:00-22:00  希望

  def show
  end

  def edit
  end

  def update
    if @shift.update(shift_params)
      redirect_to shifts_path, notice:"シフト情報を変更しました"
    else
      render "edit"
    end
  end

  def destroy
    @shift.destroy
    redirect_to shifts_path, notice: "削除しました"
  end

  private

  def shift_params
    params.require(:shift).permit(:duty_on, :started_at, :end_at, :job, :assigned_user )
  end

  def get_id
    @shift = Shift.find(params[:id])
  end

  def check_user
    redirect_to new_request_shift_path, notice:"権限がありません" unless current_user.admin?
  end
end
