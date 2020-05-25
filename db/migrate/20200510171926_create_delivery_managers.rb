class CreateDeliveryManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_managers, id: :uuid do |t|
      t.boolean :enabled, null: false, default: true

      t.timestamps
    end
  end
end
