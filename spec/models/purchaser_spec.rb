require 'spec_helper'

describe Purchaser do
	it { should validate_presence_of(:name) }
end
