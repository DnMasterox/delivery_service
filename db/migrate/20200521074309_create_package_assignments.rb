class CreatePackageAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :package_assignments do |t|
      t.references :package, type: :uuid, foreign_key: true, null: false,
                   index: true

      t.references :courier, type: :uuid, foreign_key: true, null: false,
                   index: true

      t.timestamps
    end
  end
end
