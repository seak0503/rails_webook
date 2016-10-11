require 'rails_helper'

RSpec.describe "Products", :type => :request do
  describe "GET /products.json" do
    before { @products = FactoryGirl.create_list(:product, 2) }

    example "一覧情報を取得できること" do
      # GET /products.json にアクセスする
      get products_path format: :json

      # ステータスコードの確認
      expect(response.status).to eq 200

      # JSONの確認
      json = JSON.parse(response.body)
      expect(json.size).to eq @products.count
      expect(json[0]["id"]).to eq @products[0].id
      expect(json[1]["id"]).to eq @products[1].id
    end
  end

  describe "GET /product/:id.json" do
    before { @product = FactoryGirl.create(:product) }

    example "詳細情報を取得できること" do
      # GET /product/:id.json にアクセスする
      get product_path(@product.id, format: :json)

      # ステータスコードの確認
      expect(response.status).to eq 200

      # JSONの各項目の確認
      json = JSON.parse(response.body)
      expect(json["id"]).to eq @product.id
      expect(json["name"]).to eq @product.name
      expect(json["price"]).to eq @product.price
    end
  end

  describe "POST /products.json" do
    example "商品情報が作成されること" do
      params = { product: FactoryGirl.attributes_for(:product) }
      # => {:product=>{:name=>"MyString", :price=>1, :category_id=>1}}

      # 商品数が1増えることを確認
      expect {
        post products_path(format: :json), params
      }.to change { Product.count }.by(1)

      # ステータスコードの確認
      expect(response.status).to eq 201

      # JSONの各値の確認
      json = JSON.parse(response.body)
      expect(json["name"]).to eq "MyString"
      expect(json["price"]).to eq 1

      # locationが作成したProductの詳細画面のURLであることを確認
      expect(response.location).to eq product_url(Product.last)
    end
  end

  describe "DELETE /products/:id.json" do
    before { @product = FactoryGirl.create(:product) }

    example "商品情報が削除されること" do
      # Productの数が-1されること
      expect {
        delete product_path(@product.id, format: :json)
      }.to change { Product.count }.by(-1)

      # ステータスコードの確認
      expect(response.status).to eq 204
    end
  end
end
