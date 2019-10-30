module ShiftsHelper
  def release
    status = Shift.all.select('status')
    status.each do |s|
      s == released
    end
  end
end
