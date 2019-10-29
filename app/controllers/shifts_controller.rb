class ShiftsController < ApplicationController
  before_action :get_id, only:[:show, :edit, :update, :destroy]
  before_action :check_user, only:[:create]
  before_action :authenticate_user!
  before_action :check_released, only:[:index]

  def new
    @shift = Shift.new
    @shift.assigned_works.build
  end

  def create
    @shift = Shift.new(shift_params)
    if @shift.save(context: :create)
      redirect_to shifts_path
    else
      render "new"
    end
  end

  def index
    # @shift = Shift.new
    @requests = RequestShift.all
    @q = Shift.ransack(params[:q])
    @shifts = @q.result(distinct: :true).order(duty_on: :asc)

    if params[:id]
      @requests = RequestShift.all
      @shift = Shift.find(params[:id])

      day_match_requests = @shift.match_days(@requests, @shift)
      time_match_requests = @shift.match_times(@shift)
      job_match_requests = @shift.match_jobs(@requests, @shift)
      #上記で作られた3つの配列全てで重複しているuser_idをゲット
      match_requests = [day_match_requests, time_match_requests,job_match_requests].inject( &:& )

      if match_requests.present?
         match_user_id = @shift.find_and_sort_user_id(match_requests)

         sum_worktime = @shift.end_at - @shift.started_at
         assign = @shift.assigned_works.build(user_id: match_user_id, shift_id: @shift.id, assigned_time:sum_worktime )

         @user = User.find( match_user_id)
        #ユーザーが持っているシフトの日付 登録しようとしている日付と同じだったら
         if @user.shifts.pluck(:duty_on).include?(@shift.duty_on)
           @shift.assigned_user = assign.user.name
           @shift.save
           assign.save
           flash.now[:notice]= "#{@user.name}さんは#{@shift.duty_on}で勤務が登録されているシフトがあります。登録後は重複をチェックしてください"
         else
           @shift.assigned_user = assign.user.name
           @shift.save
           assign.save
         end
      else
        redirect_to shifts_path, notice: "合致する志望者がいません"
      end
    end
  end

  def show
    @comment = @shift.comments.build
    @comments = @shift.comments
  end

  def edit
    # @shift.assigned_works.build
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

  def release
    shifts = Shift.where(status:0)#0はnonreleasedとしてenumで定義
    shifts.update(status:1)
    @shifts = Shift.where(status:1)
    redirect_to  shifts_path, notice: '公開しました'
  end

  def nonrelease
    shifts = Shift.where(status:1)#1はreleasedとしてenumで定義
    shifts.update(status:0)
    @shifts = Shift.where(status:0)
    redirect_to  shifts_path, notice: '非公開にしました'
  end

  private

  def shift_params
    params.require(:shift).permit(:duty_on, :started_at, :end_at, :job, :assigned_user, :user_ids,[],:status )
  end

  def get_id
    @shift = Shift.find(params[:id])
  end

  def check_user
    redirect_to new_request_shift_path, notice:"権限がありません" unless current_user.admin?
  end

  def check_released
    redirect_to request_shifts_path, notice: "シフトはリリース前です" unless Shift.released.present? || current_user.admin?
  end
end
