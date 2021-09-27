# frozen_string_literal: true

class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @posts = Post.all.includes(:customer)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admins_posts_path
  end
end
