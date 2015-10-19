require 'rspec'
require 'tree'

describe Tree do
  let(:tree) {Tree.new}

  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'on initialize' do
    expect(tree.age).to eq(0)
    expect(tree.height).to eq(0.5)
    expect(tree.any_apples?).to be false
  end

  it 'on age!' do
    tree.age!
    expect(tree.age).to eq(1)
  end

  it 'on add_apples and any_apples?' do
    3.times do
      tree.age!
    end
    tree.add_apples
    expect(tree.any_apples?).to be true
  end

  it 'on pick_an_apple!' do
    3.times do
      tree.age!
    end
    while tree.any_apples? do
      tree.pick_an_apple!
    end
    expect(tree.any_apples?).to be false
  end

  it 'on dead?' do
    expect(tree.dead?).to be false
    101.times do
      tree.age!
    end
    expect(tree.dead?).to be true
  end
end

describe Fruit do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end
end

describe Apple do
  let(:apple) {Apple.new('red', 3)}

  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'on initialize' do
    expect(apple.color).to eq("red")
    expect(apple.diameter).to eq(3)
  end
end
