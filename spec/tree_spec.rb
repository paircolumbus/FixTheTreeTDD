require 'rspec'
require 'tree'

describe AppleTree do

	#delete unless doing other tests on methods
	before do
		@appleTree = AppleTree.new
	end

  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end
end

describe Fruit do
	it 'should be a Class' do
		expect(described_class.is_a? Class).to be true
	end
end

describe Apple do
	it 'should be a Class' do
		expect(described_class.is_a? Class).to be true
	end
end
