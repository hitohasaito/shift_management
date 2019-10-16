class RequestShiftsController < ApplicationController
  def new
    @request = RequestShift.new
  end

  def create
    @request = RequestShift.new(request_params)
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
end
