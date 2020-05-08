# frozen_string_literal: true

# AddCompletedAtToPackages
class AddCompletedAtToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :completed_at, :datetime
  end
end
