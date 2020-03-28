cate1 = Category.create!(name: "漫才")
cate2 = Category.create!(name: "コント")
cate3 = Category.create!(name: "ピンネタ")
cate4 = Category.create!(name: "おもしろ動画")

cate1.subcategories.create!(name: "しゃべくり漫才")
cate1.subcategories.create!(name: "コント漫才")
cate1.subcategories.create!(name: "その他")

cate2.subcategories.create!(name: "おもしろキャラ")
cate2.subcategories.create!(name: "あるある")
cate2.subcategories.create!(name: "その他")

cate3.subcategories.create!(name: "おもしろキャラ")
cate3.subcategories.create!(name: "あるある")
cate3.subcategories.create!(name: "ギャグ")
cate3.subcategories.create!(name: "その他")

cate4.subcategories.create!(name: "企画")
cate4.subcategories.create!(name: "ドッキリ")
cate4.subcategories.create!(name: "その他")

User.create!(name: "サンプルユーザー",
             email: "sample@example.com",
             password: "password",
             image: File.open("./public/images/irasutoya1.png"),
             profile: "テストユーザーです")
