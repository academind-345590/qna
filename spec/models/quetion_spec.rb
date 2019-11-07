require 'rails_helper'

RSpec.describe Quetion, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }

end
