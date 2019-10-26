module ShiftsHelper
  def released?
    Shift.released.present?
  end
end
