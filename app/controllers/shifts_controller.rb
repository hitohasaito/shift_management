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
      #勤務日にマッチしている人たちのuser_idと登録日時をゲット
      day_match_requests = @shift.match_days(@requests, @shift)
      #勤務時間にマッチしている人たちのuser_idと登録日時をゲット
      time_match_requests = @shift.match_times(@shift)
      # binding.pry
      #勤務業務にマッチしている人たちのuser_idと登録日時をゲット
      job_match_requests = @shift.match_jobs(@requests, @shift)
      #3つの配列で重複しているuser_idと登録日時をゲット
      match_requests = [day_match_requests, time_match_requests,job_match_requests].inject(&:&)

      if match_requests.present?

         match_records = RequestShift.find(match_requests)
         match_columns = match_records.pluck(:user_id, :created_at)
         sort_user = match_columns.sort_by{|a, b| b }.first
         match_user_id = sort_user.first

        assign = @shift.assigned_works.build(user_id: match_user_id, shift_id: @shift.id)

        @user = User.find(match_user_id)
        if @user.shifts.pluck(:duty_on).include?(@shift.duty_on)
          flash[:notice]= "#{@user.name}さんは#{@shift.duty_on}で登録されているシフトがあります。登録後は重複をチェックしてください"
          @shift.assigned_user = assign.user.name
          @shift.save
          assign.save
        else
        #ユーザーが持っているシフトの日付 登録しようとしている日付と同じだったら
          @shift.assigned_user = assign.user.name
          @shift.save
          assign.save
        end
      else
          flash[:notice] = "合致する志望者がいません"
      end

    else
      @shifts = Shift.all.order(created_at: :asc)
      @requests = RequestShift.all
    end
  end

  def show
  end

  def edit
    @shift.assigned_works.build
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
    params.require(:shift).permit(:duty_on, :started_at, :end_at, :job, :assigned_user, :user_ids,[] )
  end

  def get_id
    @shift = Shift.find(params[:id])
  end

  def check_user
    redirect_to new_request_shift_path, notice:"権限がありません" unless current_user.admin?
  end
end
