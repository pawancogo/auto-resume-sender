# frozen_string_literal: true

class CreateHumanResource < ActiveRecord::Migration[7.1]
  def change
    create_table :human_resources do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.integer :company_id
      t.datetime :disabled_at
      t.timestamps
    end
  end
end
