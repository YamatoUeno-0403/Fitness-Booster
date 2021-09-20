class Admins::PostsController < ApplicationController
    def index
        @posts = Post.all.includes(:customer)
    end
end
