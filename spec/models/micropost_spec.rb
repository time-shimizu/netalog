require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let!(:subcategory) {create(:subcategory)}
  let!(:micropost) {create(:micropost, subcategory: subcategory)}

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
end
