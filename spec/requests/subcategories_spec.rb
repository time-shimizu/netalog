require 'rails_helper'

RSpec.describe "Subcategories", type: :request do
  describe "GET /subcategories" do
    let!(:category) {create(:category)}
    let!(:subcategory1) {create(:subcategory, category: category)}
    let!(:subcategory2) {create(:subcategory, category: category)}
    let!(:micropost1) {create(:micropost, subcategory: subcategory1)}
    let!(:micropost2) {create(:micropost, title: "hogehoge", subcategory: subcategory2)}

    before do
      get subcategory_path(subcategory1.id)
    end

    it "レスポンスが正しい" do
      expect(response).to have_http_status(200)
    end

    it "categoryが正しく表示される" do
      expect(response.body).to include category.name
    end

    it "subcategoryが正しく表示される" do
      expect(response.body).to include subcategory1.name
      expect(response.body).to include subcategory2.name
    end

    context "micropostがsubcategory1に紐づく時" do
      it "micropostが表示される" do
        expect(response.body).to include micropost1.title
      end
    end
    
    context "micropostがsubcategory2に紐づかない時" do
      it "micropostが表示されない" do
        expect(response.body).not_to include micropost2.title
      end
    end
  end
end
