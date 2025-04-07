# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.integer :form_id
      t.string :title
      t.boolean :multiple
      t.string :question_type
      t.boolean :required
      t.timestamps
    end
  end
end
