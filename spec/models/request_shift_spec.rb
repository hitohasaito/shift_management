require 'rails_helper'

RSpec.describe RequestShift, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "worked_onが空ならバリデーションが通らない" do
     request_shift = RequestShift.new(worked_on: '', start_work_at: '10:00',end_work_at: "12:00", work_job:"受付")
     expect(request_shift).not_to be_valid
  end

   it "start_work_atが空ならバリデーションが通らない" do
     request_shift = RequestShift.new(worked_on: '2019,10,10', start_work_at: '',end_work_at: "12:00", work_job:"受付")
     expect(request_shift).not_to be_valid
   end

   it "end_work_atが空ならバリデーションが通らない" do
     request_shift = RequestShift.new(worked_on: '', start_work_at: '10:00',end_work_at: "", work_job:"受付")
     expect(request_shift).not_to be_valid
   end

   it "work_jobが空ならバリデーションが通らない" do
     request_shift = RequestShift.new(worked_on: '', start_work_at: '10:00',end_work_at: "12:00", work_job: "")
     expect(request_shift).not_to be_valid
   end

   it "createアクションの時、worked_onが過去の日付の場合バリデーションが通らない" do
      request_shift = RequestShift.new(worked_on: 'Date.today-1', start_work_at: '10:00',end_work_at: "12:00", work_job: "受付")
      expect(request_shift).not_to be_valid
    end

    it "end_work_atがstart_work_atよりも早い時間だとバリデーションが通らない" do
      request_shift = RequestShift.new(worked_on: '2019,10,19', start_work_at: '12:00',end_work_at: "11:00", work_job: "自習室")
      expect(request_shift).not_to be_valid
    end
end
