require 'rails_helper'

RSpec.feature "シフト情報管理機能", type: :feature do

  background do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:second_user)

    @shift = FactoryBot.create(:shift)
    @request = FactoryBot.create(:request_shift, user_id: @user.id)

  end

  context '管理者ユーザーのログイン' do
    before do
      visit new_user_session_path

        fill_in "user_email", with: "name1@email.com"
        fill_in "user_password", with: "password1"

        click_button 'ログイン'

        expect(page).to have_content "ログインしました"
    end

    scenario "シフト作成のテスト" do
      visit new_shift_path
    #select "ラベル", from: "セレクトメニューのid"

      fill_in "shift_duty_on", with:Date.today+4
      fill_in "shift_job", with:"受付"

        # save_and_open_page
      select 10, from: "shift_started_at_4i"
      select 10, from: "shift_started_at_5i"
      select 20, from: "shift_end_at_4i"
      select 30, from: "shift_end_at_5i"

      click_button "登録する"

      visit shifts_path

      expect(page).to have_content (Date.today+4).strftime("%Y年%-m月%-d日")
      expect(page).to have_content "10時10分"
      expect(page).to have_content "20時30分"
      expect(page).to have_content "受付"

    end

    scenario "シフト詳細確認のテスト" do
      visit shift_path(1)
      # save_and_open_page

      expect(page).to have_content (Date.today+1).strftime("%Y年%-m月%-d日")
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

    scenario "シフトの非公開ボタンを押すと、シフトを非公開にできるかテスト" do
      visit shifts_path

      click_link "非公開にする"

      expect(page).to have_content "非公開にしました"
          #save_and_open_page
    end

    scenario "シフトの公開ボタンを押すと、シフトを公開にできるかテスト" do
      visit shifts_path

      click_link "非公開にする"

      click_link "公開する"

      expect(page).to have_content "公開にしました"
          #save_and_open_page
    end

    scenario "シフト一覧のテスト" do
      visit shifts_path

      expect(page).to have_content (Date.today+1).strftime("%Y年%-m月%-d日")
      expect(page).to have_content "10時30分"
      expect(page).to have_content "17時0分"
      expect(page).to have_content "自習室"
    end
  end

    context 'アルバイトユーザーのログイン' do
      before do
        visit new_user_session_path

          fill_in "user_email", with: "name2@email.com"
          fill_in "user_password", with: "password2"

          click_button 'ログイン'

          expect(page).to have_content "ログインしました"
      end


      scenario "シフト作成画面にはアクセスできない" do
        visit new_shift_path
        visit shifts_path
      end
    end

end
