class Customers::SearchesController < ApplicationController
    
  before_action :authenticate_customer!

  def index
      @range = params[:range]

  if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word])
  else
      @posts = Post.looks(params[:search], params[:word])
     
  end
  end
end
