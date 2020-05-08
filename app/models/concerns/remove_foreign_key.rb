# frozen_string_literal: true

# class RemoveForeignKey
class RemoveForeignKey < ActiveRecord::Migration[4.2]
  def change
    # remove the old foreign_key
    remove_foreign_key :packages, :couriers
  end
end
