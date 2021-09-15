# frozen_string_literal: true

class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :muscles, dependent: :destroy
  has_many :post_comments

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :customer

  # フォローしようとしているのが自分自身ではないか検証
  # 自分以外のidが見つかればリレーションを返し、見つからなければフォロー関係になる
  def follow(other_customer)
    relationships.find_or_create_by(follow_id: other_customer.id) unless self == other_customer
  end

  # フォローがあればアンフォローする
  def unfollow(other_user)
    relationship = relationships.find_by(follow_id: other_user.id)
    relationship&.destroy
  end

  # other_customerが含まれていないか確認
  def following?(other_user)
    followings.include?(other_user)
  end
  
  #current_customerのpost_idが存在していれば
  def favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end
  
  def muscled?(post)
    self.muscles.exists?(post_id: post.id)
  end
end
