require 'rails_helper'

RSpec.feature "シフト情報管理機能", type: :feature do

  background do
    @user = FactoryBot.create(:user)
    #管理者ログイン
    @shift = FactoryBot.create(:shift)
    @request = FactoryBot.create(:request_shift, user_id: @user.id)

    visit new_user_session_path

    fill_in "user_email", with: "name1@email.com"
    fill_in "user_password", with: "password1"

    # fill_in "user[email]", with: "name1@email.com"
    # fill_in "user[email]", with: "password1"

    click_button 'ログイン'

    expect(page).to have_content "ようこそ！"
  end

  scenario "シフト作成のテスト" do
    visit new_shift_path
#select "ラベル", from: "セレクトメニューのid"

    fill_in "shift_duty_on", with:"2019/10/28"
    fill_in "shift_job", with:"受付"

    # save_and_open_page
    select 10, from: "shift_started_at_4i"
    select 10, from: "shift_started_at_5i"
    select 20, from: "shift_end_at_4i"
    select 30, from: "shift_end_at_5i"
    select 30, from: "shift_end_at_5i"

    click_button "登録する"

    visit shifts_path

    expect(page).to have_content "2019年10月28日"
    expect(page).to have_content "10時10分"
    expect(page).to have_content "20時30分"
    expect(page).to have_content "受付"
  end
  #
  scenario "シフト一覧のテスト" do
    visit shifts_path

    expect(page).to have_content "2019年10月10日"
    expect(page).to have_content "10時30分"
    expect(page).to have_content "17時0分"
    expect(page).to have_content "自習室"

  end

  scenario "シフト詳細確認のテスト" do
    visit shift_path(1)

    expect(page).to have_content "2019年10月10日"
    expect(page).to have_content "10時30分"
    expect(page).to have_content "17時0分"
    expect(page).to have_content "自習室"
  end

  scenario "照合ボタンを押すと、希望に合致するアルバイトの氏名が担当者欄に入るかテスト" do
    visit shifts_path

     click_link "照合"

    expect(page).to have_content "name1"
      #save_and_open_page
  end
end
