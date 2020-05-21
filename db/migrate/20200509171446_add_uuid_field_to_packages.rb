class AddUuidFieldToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :uuid, :uuid, default: "gen_random_uuid()", null: false

    change_table :packages do |t|
      t.remove :id
    end
    execute "ALTER TABLE packages ADD PRIMARY KEY (uuid);"
  end
end
