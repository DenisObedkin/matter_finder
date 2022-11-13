require 'rails_helper'

RSpec.describe Matter, type: :model do
  include Rack::Test::Methods

  let(:matter) { create :matter }

  it "is invalid without author" do
    matter.author = nil
    expect(matter).not_to be_valid
  end

  it "is not valid without a title" do
    matter.title = nil
    expect(matter).to_not be_valid
  end

  it "is not valid without a text" do
    matter.text = nil
    expect(matter).to_not be_valid
  end

  it "is valid with valid attributes" do
    expect(matter).to be_valid
  end
end