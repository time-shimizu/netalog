require 'rails_helper'

RSpec.feature "Scores", type: :feature do
  let!(:user) {create(:user)}
  let!(:category) {create(:category)}
  let!(:subcategory) {create(:subcategory, category: category)}
  let!(:micropost) {create(:micropost, user: user, subcategory: subcategory)}

  scenario "ユーザーがログイン後、採点できる" do
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    expect{
      visit micropost_path(micropost.id)
      select "1", from: "point"
      click_button "採点する"

      expect(page).to have_content "1.0"
    }.to change{Score.count}.by(1)
  end
end
