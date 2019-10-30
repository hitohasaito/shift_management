module ShiftsHelper
  def release
    Shift.where(statu:1).present?
  end
end
