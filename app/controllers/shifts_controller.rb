class ShiftsController < ApplicationController
  before_action :get_id, only:[:show, :edit, :update, :destroy]
  before_action :check_user, only:[:create]

  def new
    @shift = Shift.new
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
    @shifts = Shift.new
    @shifts = Shift.all
    @request = RequestShift.all
    if params[:id]
        #binding.pry
      @shift = Shift.find(params[:id])
      #binding.pry

        if @request.pluck(:worked_on).index(@shift.duty_on)

          def request_id
            @request.pluck(:worked_on).index(@shift.duty_on)
          end

         match_request = RequestShift.find(request_id)
         #binding.pry

          @shift.assigned_user = match_request.user.name
          @shift.save!
        end
      else
        @shifts = Shift.all
        @request = RequestShift.all
      end
    end
    #もし三つの条件に合致していたら、その該当request.shiftのuser_idをgetする

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
    params.require(:shift).permit(:duty_on, :started_at, :end_at, :job, :assigned_user)
  end

  def get_id
    @shift = Shift.find(params[:id])
  end

  def check_user
    redirect_to new_request_shift_path, notice:"権限がありません" unless current_user.admin?
  end
end
