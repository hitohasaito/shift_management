module ShiftsHelper
  def release
    Shift.where(status:1).present?
  end
end
