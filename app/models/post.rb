# frozen_string_literal: true

class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :customer, optional: true
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
end
