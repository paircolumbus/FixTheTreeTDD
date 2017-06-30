require 'rspec'
require 'tree'

tree = Tree.new

describe Tree do
  it 'should be a Class' do
    expect(Tree.is_a? Class).to eq true
  end

  context 'when grows one foot' do
    it "equals 1" do
      tree.age!
      expect(tree.height).to eq(1)
    end
  end

  context 'when ages one year' do
    it "equals 1" do
      expect(tree.age).to eq(1)
    end
  end

  context 'when has no fruit' do
    it "equals true" do
      expect(tree.any_apples?).to eq true
    end
  end

  context 'when has apples after 3 years' do
    it "equals true" do
      tree.age!
      expect(tree.any_apples?).to be true
    end
  end

  context 'when dies after 25 years' do
    it "equals false" do
      (1..13).each{ |idx| tree.age!}
      expect(tree.dead?).to be false
    end
  end
end

describe Fruit do
  it 'should be a Class' do
    expect(Fruit.is_a? Class).to eq true
  end
end

apple = Apple.new("Red", 30)

describe Apple do
  it 'should be a Class' do
    expect(Apple.is_a? Class).to eq true
  end

  it 'is a Fruit' do
    expect(Apple < Fruit).to be true  # expects to be inheriting from apple if it is a fruit
  end

  context 'when sets a color' do
    it  "equals red" do
      expect(apple.color).to eq("Red")
    end
  end

  context 'when sets a diameter' do
    it "equals 30" do
      expect(apple.diameter).to eq(30)
    end
  end

  context 'when calls super()' do
    it "equals true" do
      expect(apple.has_seeds).to eq true
    end
  end
end
