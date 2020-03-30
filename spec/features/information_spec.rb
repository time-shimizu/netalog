require 'rails_helper'

RSpec.feature "Information", type: :feature do
  let!(:user) {create(:user)}
  let!(:other_user) {create(:user)}
  let!(:category) {create(:category)}
  let!(:subcategory) {create(:subcategory, category: category)}
  let!(:micropost) {create(:micropost, user: user, subcategory: subcategory)}

  scenario "ユーザーがフォローされたら通知が届く" do
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: other_user.email
    fill_in "パスワード",    with: other_user.password
    click_button "ログイン"

    expect{
      visit user_path(user)
      click_button "フォローする"
    }.to change{user.infos.count}.by(1)
  end

  scenario "ユーザーの投稿に返信があったら通知が届く" do
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: other_user.email
    fill_in "パスワード",    with: other_user.password
    click_button "ログイン"

    expect{
      visit micropost_path(micropost.id)
      fill_in "reply_content", with: "sample reply"
      click_button "返信する"

      expect(page).to have_content "sample reply"
    }.to change{user.infos.count}.by(1)
  end
end
