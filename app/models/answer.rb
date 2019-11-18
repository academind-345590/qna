class Answer < ApplicationRecord
  belongs_to :quetion
  validates :body, presence: true
end
