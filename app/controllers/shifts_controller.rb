class ShiftsController < ApplicationController

  def new
    @shift = Shift.new
  end
end
