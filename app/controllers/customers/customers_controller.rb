# frozen_string_literal: true

class Customers::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def index
    @post = Post.new
    @customers = Customer.includes(image_attachment: :blob)
  end

  def show
    @post = Post.new
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.includes(:post_image_attachment)
  end

  def edit
    @customer = Customer.find(params[:id])
    redirect_to customer_path(current_customer) if @customer != current_customer
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id), notice: 'You have updated user successfully.'
  end

  private

  def post_params
    params.fetch(:post, {}).permit(:content, :supplement)
  end

  def customer_params
    params.require(:customer).permit(:name, :image, :introduction)
  end
end
