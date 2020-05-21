class ChangePrimaryKey < ActiveRecord::Migration[5.2]
  def up
    add_column :packages, :uuid, :uuid, default: "gen_random_uuid()", null: false

    change_table :packages do |t|
      t.remove :id
      t.rename :uuid, :id
    end
    execute "ALTER TABLE packages ADD PRIMARY KEY (id);"
  end
  def down
    remove_column :packages, :uuid, :uuid
    add_column :packages, :id, :uuid
  end
end
