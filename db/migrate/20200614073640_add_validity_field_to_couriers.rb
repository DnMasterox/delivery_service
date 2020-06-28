class AddValidityFieldToCouriers < ActiveRecord::Migration[5.2]
  def change
    add_column :couriers, :validity, :boolean, default: false, null: false
  end
end
