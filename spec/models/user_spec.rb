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

  it "nameがない時バリデーションに引っかかる" do
    user.name = nil
    user.valid?
    expect(user.errors[:name]).to include("が入力されていません")
  end

  it "重複したメールアドレスは使えない" do
    user.email = "sample@example.com"
    user.save
    other = User.new(email: "sample@example.com", password: "hogehoge")
    other.valid?
    expect(other.errors[:email]).to include("はすでに存在します")
  end

  context "passwordが５文字の時" do
    it "バリデーションに引っかかる" do
      user.password = "a"*5
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
  end

  context "passwordが129文字の時" do
    it "バリデーションに引っかかる" do
      user.password = "a"*129
      user.valid?
      expect(user.errors[:password]).to include("は128文字以内で入力してください")
    end
  end

  context "profileが200文字の時" do
    it "バリデーションにかからない" do
      user.profile = "a"*200
      expect(user).to be_valid
    end
  end

  context "profileが201文字の時" do
    it "バリデーションにかかる" do
      user.profile = "a"*201
      user.valid?
      expect(user.errors[:profile]).to include("は200文字以内で入力してください")
    end
  end
end
