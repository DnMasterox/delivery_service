class CreateDeliveryManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_managers, id: :uuid do |t|
      t.boolean :enabled, default: true, null: false

      t.timestamps
    end
  end
end
