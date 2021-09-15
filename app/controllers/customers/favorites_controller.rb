# frozen_string_literal: true

class Customers::FavoritesController < ApplicationController
  def create
    @favorite = current_customer.favorites.create(post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = current_customer.favorites.find_by(post_id: @post.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
