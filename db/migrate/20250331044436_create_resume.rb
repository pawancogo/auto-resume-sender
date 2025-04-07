# frozen_string_literal: true

class CreateResume < ActiveRecord::Migration[7.1]
  def change
    create_table :resumes do |t|
      t.string :file
      t.integer :user_id
      t.string :subject
      t.string :description
      t.string :title
      t.integer :experience
      t.string :skills_set
      t.string :public_url
      t.string :uuid
      t.datetime :disabled_at
      t.timestamps
    end
  end
end
