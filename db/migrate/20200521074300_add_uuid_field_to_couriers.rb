class AddUuidFieldToCouriers < ActiveRecord::Migration[5.2]
  def change
    add_column :couriers, :uuid, :uuid, default: "gen_random_uuid()", null: false

    change_table :couriers do |t|
      t.remove :id
      t.rename :uuid, :id
    end
    execute "ALTER TABLE couriers ADD PRIMARY KEY (id);"
  end
end

