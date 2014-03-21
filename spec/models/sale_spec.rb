require 'spec_helper'

describe Sale do
  # pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_presence_of(:purchaser) }
  it { should validate_presence_of(:merchant) }
  it { should validate_presence_of(:item)}
  it { should validate_presence_of(:unit)}
  it { should validate_presence_of(:item_cost)}
end
