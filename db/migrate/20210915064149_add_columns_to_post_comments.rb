# frozen_string_literal: true

class AddColumnsToPostComments < ActiveRecord::Migration[5.2]
  def change
    add_column :post_comments, :post_id, :integer
  end
end
