# frozen_string_literal: true

class Customers::RelationshipsController < ApplicationController
  # ——————フォロー機能を作成・保存・削除する————————————
  def create
    current_customer.follow(params[:customer_id])
    redirect_to request.referer
  end

  def destroy
    current_customer.unfollow(params[:customer_id])
    redirect_to request.referer
  end

  # ————————フォロー・フォロワー一覧を表示する-————————————
  def followings
    @customer = Customer.find(params[:customer_id])
    customer = Customer.find(params[:customer_id])
    @customers = customer.followings
  end

  def followers
    @customer = Customer.find(params[:customer_id])
    customer = Customer.find(params[:customer_id])
    @customers = customer.followers
  end
end
