require 'rails_helper'

RSpec.describe "Homes", type: :request do
  before do
    get root_path
  end

  it "レスポンスが正しい" do
    expect(response).to have_http_status(200)
  end

  it "ログインページにとべる" do
    get new_user_session_path
    expect(response).to have_http_status(200)
  end

  it "動画一覧にとべる" do
    get microposts_path
    expect(response).to have_http_status(200)
  end

  it "ヘルプにとべる" do
    get help_path
    expect(response).to have_http_status(200)
  end

  it "利用規約にとべる" do
    get terms_path
    expect(response).to have_http_status(200)
  end

  it "お問い合わせにとべる" do
    get contact_path
    expect(response).to have_http_status(200)
  end
end
