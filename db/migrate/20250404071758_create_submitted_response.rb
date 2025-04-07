# frozen_string_literal: true

class CreateSubmittedResponse < ActiveRecord::Migration[7.1]
  def change
    create_table :submitted_responses do |t|
      t.integer :form_id
      t.integer :response_user_id
      t.timestamps
    end
  end
end
