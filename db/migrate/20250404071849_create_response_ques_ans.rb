# frozen_string_literal: true

class CreateResponseQuesAns < ActiveRecord::Migration[7.1]
  def change
    create_table :response_ques_ans do |t|
      t.integer :submitted_response_id
      t.integer :question_id
      t.string :answer
      t.timestamps
    end
  end
end
