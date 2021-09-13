class Customers::RelationshipsController < ApplicationController
    before_action :set_user

      def create
        following = current_user.follow(customer)
        if following.save
          flash[:success] = 'ユーザーをフォローしました'
          redirect_to customer
        else
          flash.now[:alert] = 'ユーザーのフォローに失敗しました'
          redirect_to customer
        end
      end
    
      def destroy
        following = current_user.unfollow(customer)
        if following.destroy
          flash[:success] = 'ユーザーのフォローを解除しました'
          redirect_to customer
        else
          flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
          redirect_to customer
        end
      end

      private
      def customer
        @customer = User.find(params[:relationship][:follow_id])
      end
end
