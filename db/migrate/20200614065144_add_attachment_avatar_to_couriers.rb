class AddAttachmentAvatarToCouriers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :couriers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :couriers, :avatar
  end
end
