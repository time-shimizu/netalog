require 'rails_helper'

RSpec.feature "Searches", type: :feature do
  let!(:user) {create(:user)}
  let!(:category) {create(:category)}
  let!(:subcategory) { create(:subcategory, name: "しゃべくり漫才")}
  let!(:micropost1) {create(:micropost, title: "first1", content: "first1", user: user, subcategory: subcategory)}
  let!(:micropost2) {create(:micropost, title: "second2", content: "second2", user: user, subcategory: subcategory)}
  let!(:micropost3) {create(:micropost, title: "first3", content: "second3", user: user, subcategory: subcategory)}
  let!(:micropost4) {create(:micropost, title: "second4", content: "first4", user: user, subcategory: subcategory)}

  scenario "検索機能が正しく働く" do
    visit microposts_path
    fill_in "search", with: "first"
    click_button "検索"
    expect(page).to have_content micropost1.title
    expect(page).not_to have_content micropost2.title
    expect(page).to have_content micropost3.title
    expect(page).to have_content micropost4.title
  end
end
