class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all
    render josn: @products
  end
end