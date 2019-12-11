class Attachment < ApplicationRecord
  belongs_to :quetion

  mount_uploader :file, FileUploader
end
