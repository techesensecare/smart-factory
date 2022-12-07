class AddAttachmentAvatarToUsuarios < ActiveRecord::Migration[4.2]
  def self.up
    change_table :usuarios do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :usuarios, :avatar
  end
end
