# frozen_string_literal: true

class Customers::PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.post_id = @post.id
    @post_comment.customer_id = current_user.id
    if @post_comment.save
      redirect_to post_path(@post.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    post_comment = @post.post_comments.find(params[:id])
    post_comment.destroy
    redirect_to request.referer # 遷移元のURLを取得してリダイレクトする
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
