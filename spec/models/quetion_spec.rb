require 'rails_helper'

RSpec.describe Quetion, type: :model do
  it "validates presece of title" do
    expect(Quetion.new(body: 'something')).to_not be_valid
  end
  it "validates presece of body" do
    expect(Quetion.new(title: 'Title')).to_not be_valid
  end
end
