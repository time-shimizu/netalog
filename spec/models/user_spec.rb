require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) {create(:user)}

  it "email,passwordがあればユーザーが有効である" do
    expect(user).to be_valid
  end

  it "emailがない時バリデーションに引っかかる" do
    user.email = nil
    user.valid?
    expect(user.errors[:email]).to include("が入力されていません。")
  end
end
