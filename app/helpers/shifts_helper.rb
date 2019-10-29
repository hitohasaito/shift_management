module ShiftsHelper
  def released?
    Shift.released.present?
  end
  def nonreleased?
    Shift.nonreleased.present?
  end
end
