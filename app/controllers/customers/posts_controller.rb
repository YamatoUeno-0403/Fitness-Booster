# frozen_string_literal: true

class Customers::PostsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @posts = Post.with_attached_image
    @post = Post.new
    @customers = Customer.all
  end

  def show
    @post = Post.find(params[:id])
    @post_new = Post.new
    @post_comments = @post.post_comments
    @post_comment = PostComment.new
    @customers =  Customer.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      @post = Post.all
      render 'index'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id), notice: 'You have updated user successfully.'
  end

  private

  def post_params
    params.fetch(:post, {}).permit(:content, :supplement, :image)
  end
end
