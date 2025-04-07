# frozen_string_literal: true

class CreateFormUser < ActiveRecord::Migration[7.1]
  def change
    create_table :form_users do |t|
      t.string :email
      t.timestamps
    end
  end
end
