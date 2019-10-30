require 'rails_helper'

RSpec.feature "コメント機能管理", type: :feature do

  background do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:second_user)

    @shift = FactoryBot.create(:shift)

    @comment = FactoryBot.create(:comment)

    visit new_user_session_path

    fill_in "user_email", with: "name1@email.com"
    fill_in "user_password", with: "password1"

    click_button 'ログイン'

    expect(page).to have_content "ログインしました"

  end

  scenario "コメント作成のテスト" do
    visit shift_path(1)

    fill_in "comment_content", with:"コメントします"

    click_button "登録する"

    expect(page).to have_content "コメントします"

  end
end
