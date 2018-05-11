require 'rspec'
require_relative '../lib/tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  let(:fuji) {Tree.new}

  it 'has a height, age, apples, alive' do
    expect(fuji.height).to eq(1)
    expect(fuji.age).to eq(0)
    expect(fuji.apples).to be_empty
    expect(fuji.alive).to be(true)
  end

  it 'does not have apples when initialized' do
    expect(fuji.any_apples?).to eq(false)
  end

  it 'is not dead when initialized' do
    expect(fuji.dead?).to eq(false)
  end

  it 'ages' do
    fuji.age!    
    expect(fuji.height).to eq(2)
    expect(fuji.age).to eq(1)
    expect(fuji.apples).to be_empty
    expect(fuji.alive).to be(true)
  end

  it 'stops growing after it is 20 feet tall' do
    21.times do fuji.age! end
    expect(fuji.height).to eq(20)
  end

  it 'has apples after it is 8 years old' do
    9.times do fuji.age! end
    expect(fuji.any_apples?).to be(true)
  end

  it 'has more than one apple after it is 9 years old' do
    10.times do fuji.age! end
    expect(fuji.apples.length).to eq(6)    
  end
  
  it 'dies after it is 100 years old' do
    101.times do fuji.age! end
    expect(fuji.dead?).to be(true)
    expect(fuji.alive).to be(false)
  end

end

describe Fruit do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  let(:plum) {Fruit.new}

  it 'has seeds' do
    expect(plum.has_seeds).to be(true)
  end
end

describe Apple do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  let(:gala) {Apple.new("pink", 4)}  

  it 'has a color and diameter' do
    expect(gala.color).to eq("pink")
    expect(gala.diameter).to eq(4)
  end

  it 'has seeds' do
    expect(gala.has_seeds).to be(true)
  end
end
