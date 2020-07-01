class AddConfirmationToPackages < ActiveRecord::Migration[5.2]
  # frozen_string_literal: true
  def change
    add_column :packages, :confirmation_token, :string
    add_column :packages, :confirmation_expiration, :datetime
  end
end

