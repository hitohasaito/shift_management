class ShiftsController < ApplicationController

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

  private

  def shift_params
    params.require(:shift).permit(:duty_on, :duty_at, :job, :assigned_user)
  end
end
