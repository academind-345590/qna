require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should belong_to :quetion}
  it { should validate_presence_of(:body) }
  it { should have_many :attachments }
  it { should accept_nested_attributes_for :attachments }
end
