class RequestShiftsController < ApplicationController
  def new
    @request = RequestShift.new
  end

  def create
    @request = RequestShift.new(request_params)
    if @request.save
      redirect_to "request_shifts_path"
    else
      render "new"
    end
  end

  private

  def request_params
    params.require(:request_shift).permit(:worked_on, :worked_at, work_job)
  end
end
