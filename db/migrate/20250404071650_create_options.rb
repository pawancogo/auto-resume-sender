# frozen_string_literal: true

class CreateOptions < ActiveRecord::Migration[7.1]
  def change
    create_table :options do |t|
      t.integer :question_id
      t.string :title
      t.timestamps
    end
  end
end
