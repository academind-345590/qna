require 'rails_helper'

RSpec.describe User, type: :model do
  it{shoild validate_presence_of :email}
  it{shoild validate_presence_of :password}
end