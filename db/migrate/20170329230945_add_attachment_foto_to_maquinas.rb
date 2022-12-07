class AddAttachmentFotoToMaquinas < ActiveRecord::Migration[4.2]
  def self.up
    change_table :maquinas do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :maquinas, :foto
  end
end
