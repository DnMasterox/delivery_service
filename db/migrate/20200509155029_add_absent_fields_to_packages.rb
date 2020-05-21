class AddAbsentFieldsToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :estimated_delivery_date, :datetime
  end
end
