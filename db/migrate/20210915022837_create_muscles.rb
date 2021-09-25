# frozen_string_literal: true

class CreateMuscles < ActiveRecord::Migration[5.2]
  def change
    create_table :muscles do |t|
      t.references :customer, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
