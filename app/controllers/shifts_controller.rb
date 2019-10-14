class ShiftsController < ApplicationController
  before_action :get_id, only:[:show]

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
    @shifts = Shift.all
  end

  def show
  end

  private

  def shift_params
    params.require(:shift).permit(:duty_on, :duty_at, :job, :assigned_user)
  end

  def get_id
    @shift = Shift.find(params[:id])
  end
end
