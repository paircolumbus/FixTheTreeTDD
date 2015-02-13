require 'rspec'
require 'tree'

describe 'Tree' do
  let(:tree) {Tree.new}

  it 'should be a Class' do
    expect(Tree.is_a? Class).to be true
  end

  it '#initialize' do
    expect(tree.height).to eq 0
    expect(tree.age).to eq 0
    expect(tree.alive).to be true
  end
end

describe 'AppleTree' do
  let(:apple_tree) {AppleTree.new}

  it 'is a Class' do
    expect(AppleTree.is_a? Class).to be true
  end

  it '#initialize' do
    expect(apple_tree.height).to eq 0
    expect(apple_tree.age).to eq 0 
    expect(apple_tree.alive).to be true
    expect(apple_tree.apples).to eq []
  end

  it '#age!' do
    expect_age = 0
    
    5.times do
      expect(apple_tree.age).to eq expect_age
      expect(apple_tree.height).to eq expect_age
      expect(apple_tree.apples.size).to eq 0

      apple_tree.age!
      expect_age += 1
    end

    5.times do
      expect(apple_tree.age).to eq expect_age
      expect(apple_tree.height).to eq 5
      
      apple_tree.age!
      expect_age += 1
    end
    
    expect(apple_tree.apples.size).to be > 0

    2.times do
      apple_tree.age!
    end

    expect(apple_tree.dead?).to be true
  end

  it 'tells you if it is dead' do
    expect(apple_tree.dead?).to be false
    12.times do
      apple_tree.age!
    end
    expect(apple_tree.dead?).to be true
  end

  it 'produces apples' do
  end

  it 'can tell if there are any apples' do
  end

  it 'let you pick an apple' do
  end
end

describe Fruit do
  it '#initialize' do
    expect(Fruit.new.has_seeds).to be_truthy
  end
end

describe Apple do
  let(:apple) {Apple.new('Green', 3)}

  it '#initialize' do
    expect(apple.has_seeds).to be true
    expect(apple.color).to eq "Green"
    expect(apple.diameter).to eq 3
  end
end
