class Quetion < ApplicationRecord
  validates :title, :body, presence: true
  has_many :answers
  has_many :attachments
end
