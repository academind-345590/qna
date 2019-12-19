class ConverAttachmentToPolymorhic < ActiveRecord::Migration[6.0]
  def change
    remove_index :attachments, :quetion_id
    rename_column :attachments, :quetion_id, :attachmentable_id
    add_index :attachments, :attachmentable_id

    add_column :attachments, :attachmentable_type, :string 
    add_index :attachments, :attachmentable_type
  end
end
