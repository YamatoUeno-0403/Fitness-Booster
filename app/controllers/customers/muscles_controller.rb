class Customers::MusclesController < ApplicationController
    
    def create
        @muscle = current_customer.muscles.create(post_id: params[:post_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        @muscle = current_customer.favorites.find_by(post_id: @post.id)
        @muscle.destroy
        redirect_back(fallback_location: root_path)
    end
end
