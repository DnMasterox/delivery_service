# frozen_string_literal: true

# class CreatePackages
class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :tracking_number
      t.integer :delivery_status, default: 0
      t.datetime :completed_at

      t.timestamps
    end
  end
end
