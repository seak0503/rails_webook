[Rails Webook](http://ruby-rails.hatenadiary.com/)の個人勉強用リポジトリです

## 要件

* ruby 2.2.5
* mysql

## 使い方

```
$ git clone git@github.com:seak0503/rails_webook.git

$ cd rails_webook

$ rbenv gemset create 2.2.5 rails_webook

$ gem install bundler

$ bundle install --path vendor/bundle

$ bin/rake db:create

$ bin/rake db:migrate

$ bin/rspec # すべてのテストが通ることを確認
```

## 補足

### RailsでAPI作成とAPIのテストのまとめ (RailsWebook/entry/20150108/1420675366.html)

* **2.1. 1つのコントローラーでHTMLやJSONを返すAPI**

コントローラの説明で下記`before`のようにしているが、`after`のようにしてもブラウザから`http://localhost:3000/products.json`にアクセスした場合に同じ結果になる

* before(app/controllers/products_controller.rb)

```
def index
  @products = Product.all

  respond_to do |format|
    format.html # app/views/products/index.html.erb
    format.json # app/views/products/index.json.jbuilder
  end
end
```

* after(app/controllers/products_controller.rb)

```
def index
  @products = Product.all
end
```