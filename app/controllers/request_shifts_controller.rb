class RequestShiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, only:[:edit,:update, :destroy]
  before_action :check_user, only:[:edit, :update, :destroy]
  def new
    @request = RequestShift.new
  end

  def create
    @request = RequestShift.new(request_params)
    @request.user_id = current_user.id
    if @request.save
      redirect_to request_shifts_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @shift.update(shift_params)
      redirect_to shifts_path, notice:"希望を変更しました"
    else
      render "edit"
    end
  end

  def destroy
    @request.destroy
    flash[:notice] = "削除しました"
  end

  def index
    @requests = RequestShift.all
  end

  private

  def request_params
    params.require(:request_shift).permit(:worked_on, :start_work_at, :end_work_at, :work_job)
  end

  def set_params
    @request = RequestShift.find(params[:id])
  end
  def check_user
    @request = RequestShift.find(params[:id])
    redirect_to request_shifts_path, notice: "権限がありません。管理者に連絡してください" unless current_user.admin?
  end
end
