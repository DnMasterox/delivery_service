# frozen_string_literal: true

# class CreateCouriers
class CreateCouriers < ActiveRecord::Migration[5.2]
  def change
    create_table :couriers do |t|
      t.string :name
      t.string :email, null: false
    end
  end
end
