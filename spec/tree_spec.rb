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
    raise unless tree(height: 15).height == 15
  end

  it 'has an age' do
    raise unless tree(age: 75).age == 75
  end

  context 'is alive' do
    subject { tree }

    it 'can have apples' do
      raise unless tree.any_apples?
    end

    it 'can have no apples' do
      raise unless not tree(apples: []).any_apples?
    end

    it 'can grow apples' do
      original_apples_count = subject.apples.count
      subject.add_apples
      new_apples_count = subject.apples.count
      raise unless original_apples_count < new_apples_count
    end

    context 'has apples' do
      it 'can be picked' do
        apple = subject.pick_an_apple!
        expect(apple.class).to eq(Apple)
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
        raise unless original_tree_height < new_tree_height
      end
    end

    context 'is 25 feet tall' do
      subject { tree(height: 25) }

      it 'cannot grow taller' do
        original_tree_height = subject.height
        subject.age!
        new_tree_height = subject.height
        raise unless original_tree_height == new_tree_height
      end
    end

    context 'is less than 200 years old' do
      it 'can grow older' do
        original_tree_age = subject.age
        subject.age!
        new_tree_age = subject.age
        raise unless original_tree_age < new_tree_age
      end
    end

    context 'is 200 years old' do
      subject { tree(age: 200) }

      it 'dies' do
        subject.age!
        raise unless subject.dead?
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
      raise unless @dead_tree.apples.count == 0
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
    raise unless Fruit.new.has_seeds?
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
    raise unless apple(color: "green").color == "green"
  end

  it 'has a diameter' do
    raise unless apple(diameter: 2).diameter == 2
  end

  it 'has seeds' do
    raise unless Apple.new.has_seeds?
  end
end
