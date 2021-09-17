# frozen_string_literal: true

class Post < ApplicationRecord
  has_one_attached :image

  belongs_to :customer
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :muscles, dependent: :destroy
end
