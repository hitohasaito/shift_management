module ShiftsHelper
  def release?
    Shift.where(status:0).present?
  end
  def nonrelease?
      Shift.where(status:1).present?
  end
end
#tatus:{released: 0,nonreleased: 1}で定義
