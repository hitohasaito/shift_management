class RequestShiftsController < ApplicationController
  before_action :authenticate_user!
  # before_action :check_user, only:[:index]
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

  def index
    @requests = RequestShift.all
  end

  private

  def request_params
    params.require(:request_shift).permit(:worked_on, :start_work_at, :end_work_at, :work_job)
  end
  def check_user
    @request = RequestShift.find(params[:id])
    redirect_to new_request_shift_path, notice:"権限がありません" unless current_user.id == @request.user_id
  end
end
