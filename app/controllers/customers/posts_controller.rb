# frozen_string_literal: true

class Customers::PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def new; end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      @post = Post.all
      render 'index'
    end
  end

  def edit; end

  def update; end

  private

  def post_params
    params.require(:post).permit(:content, :supplement)
  end
end
