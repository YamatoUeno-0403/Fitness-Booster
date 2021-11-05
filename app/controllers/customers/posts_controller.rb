# frozen_string_literal: true

class Customers::PostsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @posts = Post.includes(:image_attachment, :customer, :taggings, :post_image_attachment).page(params[:page]).per(5).order(created_at: :desc)
    @posts = Post.tagged_with(params[:tag_name]).includes(:image_attachment, :customer, :taggings, :post_image_attachment).page(params[:page]).per(5) if params[:tag_name]
    @post_new = Post.new
    @customers = Customer.all
  end

  def show
    @post = Post.find(params[:id])
    @post_new = Post.new
    @post_comments = @post.post_comments
    @post_comment = PostComment.new
    @customer = @post.customer
    @post_comments = @post.post_comments.includes(:customer).order(created_at: :desc)
    
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    @post.score = Language.get_data(post_params[:content])  #この行を追加
    if @post.save
      redirect_to post_path(@post.id)
      @posts = Post.all
    else
      @post = Post.all
      render 'index'
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.customer != current_customer
      redirect_to post_path(@post.id)
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: '変更が完了しました'
    else 
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @posts = Post.all
  end

  private

  def post_params
    params.fetch(:post, {}).permit(:content, :supplement, :image, :tag_list, :post_image)
  end
end
