# frozen_string_literal: true

class Customers::CustomersController < ApplicationController
  def index
    @post = Post.new(post_params)
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit; end

  def post_params
    params.fetch(:post, {}).permit(:content, :supplement)
  end
end
