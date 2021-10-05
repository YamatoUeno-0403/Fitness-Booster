# frozen_string_literal: true

class Customers::PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.post_id = @post.id
    @post_comment.customer_id = current_customer.id
    @post_comment.save
    @post_comments = PostComment.where(post_id: params[:post_id]).order(created_at: :desc) # 最新のVIEW情報を定義し直す
  end

  def destroy
    @post = Post.find(params[:post_id])
    post_comment = @post.post_comments.find(params[:id])
    post_comment.destroy
    @post_comments = PostComment.where(post_id: params[:post_id]) # 最新のVIEW情報を定義し直す
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
