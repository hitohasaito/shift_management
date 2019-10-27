require 'rails_helper'

RSpec.feature "シフト情報管理機能", type: :feature do

  background do
    @user = FactoryBot.create(:user)
    #管理者ログイン
    @shift = FactoryBot.create(:shift)
    # @request = FactoryBot.create(:request_shift, user_id: @user.id)

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

    fill_in "shift_duty_on", with:"2019,10,28"
    # save_and_open_page
    select 10, from: "shift_started_at_4i"
    select 10, from: "shift_started_at_5i"
    select 12, from: "shift_end_at_4i"
    select 30, from: "shift_end_at_5i"
    # byebug
    # expect(page).to have_content "2019年10月28日"
    expect(page).to have_content "2019-10-28"
    expect(page).to have_content "10時10分"
    expect(page).to have_content "12時30分"
  end
  #
  # scenario "シフト一覧のテスト" do
  #   visit shifts_path
  #
  #   expect(page).to have_content "2019年10月10日"
  #   expect(page).to have_content "10時0分"
  #   expect(page).to have_content "受付"
  #
  # end
end
