require 'rspec'
require 'tree'

describe AppleTree do
  context 'when AppleTree exists' do
    subject(:tree) { AppleTree.new }
    it 'should be a Class' do
      expect(described_class.is_a? Class).to be true
    end

    it 'should be a newborn tree' do
      expect(tree.age).to eq 0
    end

    it 'should have no apples' do
      expect(tree.any_apples?).to eq false
    end

    it 'should be alive' do
      expect(tree.alive).to eq true
    end

    it 'should age when told to' do
      expect(tree.age!).to eq 1
    end

    it 'should get taller as it ages' do
      tree.age!
      expect(tree.height).to be > 0
    end

    it 'should die after 10 years' do
      10.times {
        tree.age!
      }
      expect(tree.dead?).to eq true
    end

    it 'should produce fruit after 1 year' do
      tree.age!
      expect(tree.any_apples?).to eq true
    end

    it 'should let me pick an apple' do
      tree.age!
      expect(tree.pick_an_apple!).to respond_to :diameter
    end
  end

end

describe Fruit do
  subject(:fruit) {Fruit.new}
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'should have seeds' do
    expect(fruit.has_seeds).to eq true
  end
end

describe Apple do
  subject(:apple){Apple.new('Red', 5)}
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'should have a color' do
    expect(apple.color).to eq 'Red'
  end

  it 'should have a diameter' do
    expect(apple.diameter).to eq 5
  end
end
