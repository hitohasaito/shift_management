class RequestShiftsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_id, only:[:edit,:update, :destroy, :show]
  before_action :check_admin_user, only:[:edit, :update, :destroy]
  before_action :check_admin_user_or_current_user,only:[:show]

  def new
    @request = RequestShift.new
  end

  def create
    @request = RequestShift.new(request_params)
    @request.user_id = current_user.id
    if @request.save(context: :create)
      redirect_to request_shifts_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @request.update(request_params)
      redirect_to request_shifts_path, notice:"希望を変更しました"
    else
      render "edit"
    end
  end

  def destroy
    @request.destroy
    redirect_to shifts_path
    flash[:notice] = "削除しました"
  end

  def index
    @q = RequestShift.ransack(params[:q])
    @requests = @q.result(distinct: :true).order(worked_on: :asc)
  end

  def show
  end

  private

  def request_params
    params.require(:request_shift).permit(:worked_on, :start_work_at, :end_work_at, :work_job)
  end

  def set_id
    @request = RequestShift.find(params[:id])
  end

  def check_admin_user
    @request = RequestShift.find(params[:id])
    redirect_to new_request_shift_path, notice: "権限がありません。管理者に連絡してください" unless current_user.admin?
  end

  def check_admin_user_or_current_user
    @request = RequestShift.find(params[:id])
    redirect_to new_request_shift_path, notice: "権限がありません。" unless current_user.admin? || @request.user_id == current_user.id
  end
end
