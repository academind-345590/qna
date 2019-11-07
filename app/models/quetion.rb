class Quetion < ApplicationRecord
  validates :title, :body, presence: true
end
