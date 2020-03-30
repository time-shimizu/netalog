require 'rails_helper'

RSpec.feature "Microposts", type: :feature do
  let!(:category) {create(:category, name: "漫才")}
  let!(:subcategory) { create(:subcategory, name: "しゃべくり漫才", category: category)}
  let(:user) {create(:user)}

  scenario "ユーザーがログイン後、投稿できる" do
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
    expect(page).to have_content user.name

    expect{
      click_link "動画を投稿する"
      fill_in "タイトル", with: "sample title"
      fill_in "youtubeのURL", with: "youtubeurl"
      fill_in "説明", with: "hogehoge"
      select "漫才|しゃべくり漫才", from: "カテゴリ"
      click_button "投稿する"

      expect(page).to have_content user.name
      expect(page).to have_content "sample title"
      expect(page).to have_content "漫才|しゃべくり漫才"
    }.to change{Micropost.count}.by(1)
  end
end
