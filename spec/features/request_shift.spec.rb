require 'rails_helper'

RSpec.feature "勤務希望管理", type: :feature do
    background do
      @user = FactoryBot.create(:user)
      #管理者ログイン
      @shift = FactoryBot.create(:shift)
      @request = FactoryBot.create(:request_shift, user_id: @user.id)

      visit new_user_session_path

      fill_in "user_email", with: "name1@email.com"
      fill_in "user_password", with: "password1"

      click_button 'ログイン'

      expect(page).to have_content "ようこそ！"
    end

    scenario "勤務希望登録のテスト" do
      visit new_request_shift_path
  #select "ラベル", from: "セレクトメニューのid"

      fill_in "request_shift_worked_on", with:"2019/10/17"
      fill_in "request_shift_work_job", with:"自習室"

       # save_and_open_page
      select 13, from: "request_shift_start_work_at_4i"
      select 30, from: "request_shift_start_work_at_5i"
      select 19, from: "request_shift_end_work_at_4i"
      select 30, from: "request_shift_end_work_at_5i"

      click_button "登録"

      visit request_shifts_path

      expect(page).to have_content "2019年10月17日"
      expect(page).to have_content "13時30分"
      expect(page).to have_content "19時30分"
      expect(page).to have_content "自習室"
    end

    scenario "勤務希望一覧のテスト" do
      visit request_shifts_path

      expect(page).to have_content "2019年10月10日"
      expect(page).to have_content "10時0分"
      expect(page).to have_content "19時0分"
      expect(page).to have_content "自習室"

    end

    scenario "勤務希望詳細確認のテスト" do
      visit request_shift_path(1)

      expect(page).to have_content "2019年10月10日"
      expect(page).to have_content "10時00分"
      expect(page).to have_content "19時0分"
      expect(page).to have_content "自習室"

    end
end
