require 'rspec'
require 'tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  let(:tree) { Tree.new }

  context 'when tree is created' do
    it '#age is zero' do
      expect(tree.age).to eq 0
    end

    it 'height is 1 foot' do
      expect(tree.height).to eq 1
    end

    it 'has no apples' do
      expect(tree.any_apples?).to be false
    end

    it 'is alive' do
      expect(tree.alive).to be true
      expect(tree.dead?).to be false
    end
  end

  it '#age! increases #age by one' do
    tree.age!
    expect(tree.age).to eq 1

    tree.age!
    expect(tree.age).to eq 2
  end

  it 'height increases by 1 foot per year' do
    2.times { tree.age! }
    expect(tree.height).to eq 3
  end

  it 'has no apples until 3 years' do
    2.times { tree.age! }
    expect(tree.any_apples?).to be false
    tree.age!
    expect(tree.any_apples?).to be true
  end

  it 'lives 30 years' do
    30.times { tree.age! }
    expect(tree.dead?).to be false
  end

  it 'does not live 31 years' do
    31.times { tree.age! }
    expect(tree.dead?).to be true
  end

  context 'when no apples' do
    it '#pick_an_apple!' do
      expect { tree.pick_an_apple! }.to raise_error NoApplesError
    end
  end

  context 'when has apples' do
    it '#pick_an_apple!' do
      3.times { tree.age! }
      apple = tree.pick_an_apple!
      expect(apple.is_a? Apple).to be true
    end
  end

end

describe Fruit do
  it 'should be a class' do
    expect(described_class.is_a? Class).to be true
  end
end

describe Apple do
  let(:apple) { Apple.new('red', 5) }
  it 'should be a class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'should have the right color' do
    expect(apple.color).to eq 'red'
  end

  it 'should have the right diameter' do
    expect(apple.diameter).to eq 5
  end

end
