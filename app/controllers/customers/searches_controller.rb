# frozen_string_literal: true

class Customers::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @word = params[:word]
    @range = params[:range]

    if @range == 'Customer'
      @customers = Customer.looks_word(params[:word])
    else
      @posts = Post.looks_word(params[:word])

    end
  end
end
