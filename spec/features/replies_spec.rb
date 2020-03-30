require 'rails_helper'

RSpec.feature "Replies", type: :feature do
  let!(:user) {create(:user)}
  let!(:category) {create(:category)}
  let!(:subcategory) {create(:subcategory, category: category)}
  let!(:micropost) {create(:micropost, user: user, subcategory: subcategory)}

  scenario "ユーザーがログイン後投稿に返信できる" do
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード",    with: user.password
    click_button "ログイン"

    expect{
      visit micropost_path(micropost.id)
      fill_in "reply_content", with: "sample reply"
      click_button "返信する"

      expect(page).to have_content "sample reply"
    }.to change{Reply.count}.by(1)
  end
end
