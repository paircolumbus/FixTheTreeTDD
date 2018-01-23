require 'rspec'
require 'tree'

def apple(params = {})
  defaults = {
    color: "red",
    diameter: 3
  }

  Apple.new(**defaults.merge(params))
end

def tree(params = {})
  defaults = {
    height: 20,
    age: 10,
    apples: [apple(diameter: 3),
      apple(diameter: 2),
      apple(diameter: 3)],
    alive: true
  }

  Tree.new(**defaults.merge(params))
end

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'has a height' do
    expect(tree(height: 15).height).to eq(15)
  end

  it 'has an age' do
    expect(tree(age: 75).age).to eq(75)
  end

  context 'is alive' do
    subject { tree }

    it 'can have apples' do
      expect(tree.any_apples?).to be true
    end

    it 'can have no apples' do
      expect(tree(apples: []).any_apples?).to be false
    end

    it 'can grow apples' do
      original_apples_count = subject.apples.count
      subject.add_apples
      new_apples_count = subject.apples.count
      expect(original_apples_count).to be < new_apples_count
    end

    context 'has apples' do
      it 'can be picked' do
        picked_apple = subject.pick_an_apple!
        expect(picked_apple.class).to eq(Apple)
      end
    end

    context 'has no apples' do
      subject { tree(apples: []) }

      it 'cannot be picked' do
        expect { subject.pick_an_apple! }.to raise_error(NoApplesError)
      end
    end

    context 'is less than 25 feet tall' do
      it 'can grow taller' do
        original_tree_height = subject.height
        subject.age!
        new_tree_height = subject.height
        expect(original_tree_height).to be < new_tree_height
      end
    end

    context 'is 25 feet tall' do
      subject { tree(height: 25) }

      it 'cannot grow taller' do
        original_tree_height = subject.height
        subject.age!
        new_tree_height = subject.height
        expect(original_tree_height).to eq new_tree_height
      end
    end

    context 'is less than 200 years old' do
      it 'can grow older' do
        original_tree_age = subject.age
        subject.age!
        new_tree_age = subject.age
        expect(original_tree_age).to be < new_tree_age
      end
    end

    context 'is 200 years old' do
      subject { tree(age: 200) }

      it 'dies' do
        subject.age!
        expect(subject.dead?).to be true
      end
    end
  end

  before(:context) do
    @dead_tree = tree
    @dead_tree.kill!
  end

  context 'is dead' do
    it 'cannot age' do
      expect { @dead_tree.age! }.to raise_error(DeadTreeError)
    end

    it 'has no apples' do
      expect(@dead_tree.apples.count).to eq(0)
    end

    it 'cannot grow apples' do
      expect { @dead_tree.add_apples }.to raise_error(DeadTreeError)
    end

    it 'cannot be picked' do
      expect { @dead_tree.pick_an_apple! }.to raise_error(DeadTreeError)
    end
  end
end

describe Fruit do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'has seeds' do
    expect(Fruit.new.has_seeds?).to be true
  end
end

describe Apple do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

  it 'should be a Fruit' do
    expect(described_class.superclass).to eq(Fruit)
  end

  it 'has a color' do
    expect(apple(color: "green").color).to eq("green")
  end

  it 'has a diameter' do
    expect(apple(diameter: 2).diameter).to eq(2)
  end

  it 'has seeds' do
    expect(apple.has_seeds?).to be true
  end
end
