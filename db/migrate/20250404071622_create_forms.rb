# frozen_string_literal: true

class CreateForms < ActiveRecord::Migration[7.1]
  def change
    create_table :forms do |t|
      t.integer :form_user_id
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
