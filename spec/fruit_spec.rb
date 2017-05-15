require 'trees/fruit'

describe Fruit do
  let(:fruit) { Fruit.new }

  it 'should have seeds' do
    expect(fruit.has_seeds).to eq true
  end
end

