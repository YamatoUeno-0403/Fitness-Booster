# frozen_string_literal: true

class PostComment < ApplicationRecord
    validates :comment, presence: true
    
     belongs_to :customer
     belongs_to :post
      
       
end
