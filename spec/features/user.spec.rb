require 'rails_helper'

RSpec.feature "ユーザー", type: :feature do
  background do
      @user = FactoryBot.create(:user)
      @second_user = FactoryBot.create(:second_user)
      @third_user = FactoryBot.create(:third_user)
  end

  scenario "メールアドレスとパスワードの組み合わせが合っていればログインできること" do

    visit new_user_session_path

    fill_in "user_email", with: "name2@email.com"
    fill_in "user_password", with: "password2"

    click_button "ログイン"

    expect(page).to have_content "ようこそ！"
  #save_and_open_page
  end

  context '管理者ユーザーのログイン' do
    before do
      visit new_user_session_path

      fill_in "user_email", with: "name1@email.com"
      fill_in "user_password", with: "password1"

      click_button 'ログイン'

      expect(page).to have_content "ようこそ！"
    end

    scenario "ユーザー登録のテスト" do

      visit new_user_registration_path

      fill_in "user_name", with: "name4"
      fill_in "user_email", with: "name5@email.com"
      fill_in "user_number", with: "08077776666"
      fill_in "user_password", with: "password4"

      click_button "登録"

      expect(page).to have_content "name4"
    #save_and_open_page
    end
  end


  context 'アルバイトユーザーのログイン' do
    before do
      visit new_user_session_path

      fill_in "user_email", with: "name2@email.com"
      fill_in "user_password", with: "password2"

      click_button 'ログイン'

      expect(page).to have_content "ようこそ！"
    end

    scenario "自分以外のユーザー編集画面へアクセスできないテスト" do

      visit edit_user_path(@third_user.id)

      expect(page).to have_content("シフト一覧")
      #save_and_open_page
    end

    scenario "ユーザー一覧画面にアクセスできないテスト" do
      visit shifts_path

      visit users_path
      expect(page).to have_content("シフト一覧")
      #save_and_open_page
    end
  end
end
