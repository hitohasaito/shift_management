require 'rails_helper'

RSpec.describe Shift, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "duty_onが空ならバリデーションが通らない" do
     shift = Shift.new(duty_on: '', started_at: '10:00',end_at: "12:00", job:"受付")
     expect(shift).not_to be_valid
  end

   it "started_atが空ならバリデーションが通らない" do
     shift = Shift.new(duty_on: 'Date.today', started_at: '',end_at: "12:00", job:"受付")
     expect(shift).not_to be_valid
   end

   it "end_atが空ならバリデーションが通らない" do
     shift = Shift.new(duty_on: 'Date.today', started_at: '10:00',end_at: "", job:"受付")
     expect(shift).not_to be_valid
   end

   it "jobが空ならバリデーションが通らない" do
     shift = Shift.new(duty_on: 'Date.today', started_at: '10:00',end_at: "12:00", job:"")
     expect(shift).not_to be_valid
   end

   it "createアクションの時、duty_onが過去の日付の場合バリデーションが通らない" do
     shift = Shift.new(duty_on: 'Date.today-1', started_at: '10:00',end_at: "12:00", job:"受付")
     expect(shift).not_to be_valid
   end

   it "end_atがstarted_atよりも早い時間だとバリデーションが通らない" do
     shift = Shift.new(duty_on: '2019,10,19', started_at: '12:00',end_at: "11:00", job:"自習室")
     expect(shift).not_to be_valid
   end
end
