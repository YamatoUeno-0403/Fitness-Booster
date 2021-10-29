# frozen_string_literal: true

class Post < ApplicationRecord
  validates :tag_list,presence: true,length: {maximum: 20}
  validates :content, presence: true,length: {maximum: 200}
  
  
  has_one_attached :image
  has_one_attached :post_image

  acts_as_taggable

  belongs_to :customer, optional: true
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :muscles, dependent: :destroy

  # 検索方法分岐
  def self.looks_word(word)
    @post = Post.where('content LIKE?', "%#{word}%")
  end
  

end
