require 'rspec'
require 'tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be_truthy # for some reason expect(true).to be_true is failing
  end

  it 'should initialize with correct values' do
    t = Tree.new
    expect(t.height).to eq 0
    expect(t.age).to eq 0
    expect(t.alive).to be_truthy
  end

  it 'should age correctly' do
    t = Tree.new
    (1..5).each {t.age!}
    expect(t.height).to eq 10
    expect(t.age).to eq 5

    (6..10).each {t.age!}
    expect(t.height).to eq 19
    expect(t.age).to eq 10

    (12..101).each {t.age!}
    expect(t.alive).to be_falsy
  end

end

describe AppleTree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be_truthy
  end

  it 'should extend Tree' do
    expect(described_class.superclass).to eq Tree
  end

  it 'should grow some number of apples after ten years' do
    t = AppleTree.new
    (1..11).each {t.age!}
    expect(t.apples.length).to be > 0
  end
end

describe Fruit do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be_truthy
  end

  it 'should have seeds' do
    expect(Fruit.new.has_seeds).to be_truthy
  end
end

describe Apple do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be_truthy
  end

  it 'should extend Fruit' do
    expect(described_class.superclass).to eq Fruit
  end

  it 'should be initialized with correct color and diameter' do
    a = Apple.new("red", 4)
    expect(a.color).to eq "red"
    expect(a.diameter).to eq 4
  end

end
