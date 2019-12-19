class Answer < ApplicationRecord
  belongs_to :quetion
  has_many :attachments, as: :attachmentable

  validates :body, presence: true

  accepts_nested_attributes_for :attachments
end
