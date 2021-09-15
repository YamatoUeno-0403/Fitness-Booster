# frozen_string_literal: true

class Customers::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def index
    @post = Post.new(post_params)
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @post = Post.new
  end

  def edit
    @customer = Customer.find(params[:id])
    if @customer != current_customer
      redirect_to customer_path(current_customer)
    end
  end
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id), notice: "You have updated user successfully."
  end

private
  def post_params
    params.fetch(:post, {}).permit(:content, :supplement)
  end
  def customer_params
    params.require(:customer).permit(:name)
  end
end
