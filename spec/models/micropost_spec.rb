require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let!(:subcategory) {create(:subcategory)}
  let!(:micropost) {create(:micropost, subcategory: subcategory)}
  let!(:user) {create(:user)}
  let!(:score) {create(:score, micropost: micropost, user: user)}
  let!(:reply) {create(:reply, micropost: micropost, user: user)}

  context "title contentがある時" do
    it "micropostは有効である" do
      expect(micropost).to be_valid
    end
  end

  context "titleがnilの時" do
    it "バリデーションにかかる" do
      micropost.title = nil
      micropost.valid?
      expect(micropost.errors[:title]).to include "を入力してください"
    end
  end

  context "contentがnilの時" do
    it "バリデーションにかかる" do
      micropost.content = nil
      micropost.valid?
      expect(micropost.errors[:content]).to include "を入力してください"
    end
  end

  context "subcategoryがnilの時" do
    it "バリデーションにかかる" do
      micropost.subcategory_id = nil
      expect(micropost).not_to be_valid
    end
  end

  it "micropostを削除した時,scoreも削除される" do
    expect{micropost.destroy}.to change{Score.count}.by(-1)
  end

  it "micropostを削除した時,replyも削除される" do
    expect{micropost.destroy}.to change{Reply.count}.by(-1)
  end
end
