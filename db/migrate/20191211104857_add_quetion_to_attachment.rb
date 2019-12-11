class AddQuetionToAttachment < ActiveRecord::Migration[6.0]
  def change
    add_column :attachments, :quetion_id, :integer
    add_index :attachments, :quetion_id
  end
end
