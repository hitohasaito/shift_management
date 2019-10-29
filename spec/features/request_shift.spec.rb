require 'rails_helper'

RSpec.feature "勤務希望管理", type: :feature do
    background do
      @user = FactoryBot.create(:user) #管理者
      @second_user = FactoryBot.create(:second_user)
      @third_user = FactoryBot.create(:third_user)

      @shift = FactoryBot.create(:shift)

      @request = FactoryBot.create(:request_shift, user_id: @second_user.id)
      @second_request = FactoryBot.create(:second_request_shift, user_id: @third_user.id)

    end


  context "アルバイトユーザーのログイン" do
    before do
      visit new_user_session_path

      fill_in "user_email", with: "name2@email.com"
      fill_in "user_password", with: "password2"

      click_button 'ログイン'

      expect(page).to have_content "ログインしました"
    end

    scenario "勤務希望登録のテスト" do
      visit new_request_shift_path

      fill_in "request_shift_worked_on", with:Date.today+1
      fill_in "request_shift_work_job", with:"自習室"

      select 13, from: "request_shift_start_work_at_4i"
      select 30, from: "request_shift_start_work_at_5i"
      select 19, from: "request_shift_end_work_at_4i"
      select 30, from: "request_shift_end_work_at_5i"

      click_button "登録"

      visit request_shifts_path
      # save_and_open_page
      expect(page).to have_content (Date.today+1).strftime("%Y年%-m月%-d日")
      expect(page).to have_content "13時30分"
      expect(page).to have_content "19時30分"
      expect(page).to have_content "自習室"
    end


    scenario "自分の勤務希望一覧が表示されるテスト" do
      visit request_shifts_path

      expect(page).to have_content (Date.today+1).strftime("%Y年%-m月%-d日")
      expect(page).to have_content "10時0分"
      expect(page).to have_content "19時0分"
      expect(page).to have_content "自習室"

    end

    scenario "勤務希望詳細確認のテスト" do

      visit request_shift_path(1)

      expect(page).to have_content (Date.today+1).strftime("%Y年%-m月%-d日")
      expect(page).to have_content "10時0分"
      expect(page).to have_content "19時0分"
      expect(page).to have_content "自習室"

    end
  end

  context "管理者でログイン" do
    before do
      visit new_user_session_path

      fill_in "user_email", with: "name1@email.com"
      fill_in "user_password", with: "password1"

      click_button 'ログイン'

      expect(page).to have_content "ログインしました"
    end

    scenario "全てのユーザーの勤務希望一覧が表示されるテスト" do
      visit request_shifts_path

      expect(page).to have_content (Date.today+1).strftime("%Y年%-m月%-d日")
      expect(page).to have_content "10時0分"
      expect(page).to have_content "19時0分"
      expect(page).to have_content "自習室"
      expect(page).to have_content (Date.today+2).strftime("%Y年%-m月%-d日")
      expect(page).to have_content "18時0分"
      expect(page).to have_content "22時0分"
      expect(page).to have_content "自習室"
    end
  end
end
