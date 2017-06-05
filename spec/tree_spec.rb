require 'rspec'
require 'tree'

describe Tree do
  let(:tree) { Tree.new }

  it 'should be a Class' do
    expect(described_class).to be_a(Class)
  end

  it 'can age to a positive, non-zero maximum' do
    expect { Tree.new(-1) }.to raise_error(ArgumentError)
    expect { Tree.new(0) }.to raise_error(ArgumentError)

    expect { Tree.new(1) }.not_to raise_error
    expect { Tree.new }.not_to raise_error
  end

  it 'can grow by a positive, non-zero rate' do
    expect { Tree.new(max_growth: -1) }.to raise_error(ArgumentError)
    expect { Tree.new(max_growth: 0) }.to raise_error(ArgumentError)

    expect { Tree.new(max_growth: 1) }.not_to raise_error
    expect { Tree.new }.not_to raise_error
  end

  it 'starts out alive' do
    expect(tree).not_to be_dead
  end

  it 'starts out with no apples' do
    expect(tree.apples).to be_empty
  end

  it 'starts at age 0 with height 0 and no apples' do
    expect(tree.age).to eq 0
    expect(tree.height).to eq 0
  end

  it 'ages a year at a time' do
    tree.age!
    expect(tree.age).to eq 1

    3.times { tree.age! }
    expect(tree.age).to eq 4
  end

  it 'grows in height when it ages' do
    tree.age!
    expect(tree.height).to be > 0
  end

  it 'grows apples when it ages' do
    tree.age!
    expect(tree).to be_any_apples
  end

  it 'grows apples of a particular color' do
    tree = Tree.new(apple_color: 'red')
    tree.age! until tree.apples.length > 1

    apple_colors = tree.apples.map &:color
    expect(apple_colors).to all( eq 'red' )
  end

  it 'dies at a max age' do
    tree = Tree.new 20

    expect(tree).not_to be_dead

    # If tree is not dead after 21 iterations then the
    # tree is undying and that's probably impossible in reality.ss
    until tree.dead? or tree.age > 20
      tree.age!
    end

    expect(tree).to be_dead
  end

  it 'should continue to age in death' do
    tree.age! until tree.dead?

    start_age = tree.age
    tree.age!

    expect(tree.age - start_age).to eq 1

    start_age = tree.age
    20.times { tree.age! }

    expect(tree.age - start_age).to eq 20
  end

  it 'does not grow once dead' do
    tree.age! until tree.dead?

    start_height = tree.height
    tree.age!
    expect(tree.height - start_height).to be_zero
  end

  it 'does not bear fruit once dead' do
    tree.age! until tree.dead?
    tree.pick_an_apple! while tree.any_apples?

    tree.age!
    expect(tree.apples).to be_empty
  end

  it 'provides an apple, if it has any' do
    tree.age!

    apple = tree.pick_an_apple!
    expect(apple).not_to be nil
    expect(apple).to be_instance_of(Apple)
  end

  it 'throws a NoApplesError when picking apples if none exists' do
    expect { tree.pick_an_apple! }.to raise_error(NoApplesError)

    tree.age!
    tree.pick_an_apple! while tree.any_apples?

    expect { tree.pick_an_apple! }.to raise_error(NoApplesError)
  end

  it 'can magically have apples added to it. By magic.' do
    tree.add_apples
    expect(tree.apples).not_to be_empty
  end
end

describe Fruit do
  let(:fruit) { Fruit.new }

  it 'is a Class' do
    expect(described_class).to be_a(Class)
  end

  it 'has seeds' do
    expect(fruit.has_seeds).to be true
  end
end

describe Apple do
  let(:apple) { Apple.new('international orange', rand(3..10)) }

  it 'is a Class' do
    expect(described_class).to be_a(Class)
  end

  it 'is a subclass of Fruit' do
    expect(described_class).to be < Fruit
  end

  it 'has seeds' do
    expect(apple.has_seeds).to be true
  end

  it 'has a color' do
    expect { Apple.new(nil, 2) }.to raise_error(ArgumentError)

    expect(apple.color).not_to be_nil
    expect(apple.color).to eq 'international orange'
  end

  it 'has a finite, positive, non-zero diameter' do
    expect_failure = lambda { |d| expect { Apple.new('red', d) }.to raise_error(ArgumentError) }
    expect_success = lambda { |d| expect { Apple.new('red', d) }.not_to raise_error }

    [Float::INFINITY, -Float::INFINITY].each &expect_failure
    [-1, 0].each &expect_failure
    [1, 4, 2304].each &expect_success
  end
end
