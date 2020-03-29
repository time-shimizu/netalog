require 'rails_helper'

RSpec.describe Reply, type: :model do
  let!(:user) {create(:user)}
  let!(:subcategory) {create(:subcategory)}
  let!(:micropost) {create(:micropost, subcategory: subcategory)}
  let!(:reply) {create(:reply, user: user, micropost: micropost)}
  let!(:new_reply) {create(:reply, user: user, micropost: micropost)}


  context "contentがnilではない時" do
    it "バリデーションにかからない" do
      expect(reply).to be_valid
    end
  end

  context "contentがnilの時" do
    it "バリデーションにかかる" do
      reply.content = nil
      reply.valid?
      expect(reply.errors[:content]).to include "を入力してください"
    end
  end

  it "後にできたreplyが上に表示される" do
    expect(new_reply).to eq(Reply.first)
  end
end
