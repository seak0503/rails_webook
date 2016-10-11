class Api::V2::ProductsController < ApplicationController
  def index
    @products = Product.all
    render josn: @products
  end
end