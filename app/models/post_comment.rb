# frozen_string_literal: true

class PostComment < ApplicationRecord
  belongs_to :user
end
