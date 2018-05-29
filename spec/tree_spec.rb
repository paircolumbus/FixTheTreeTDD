require 'rspec'
require_relative '../lib/tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a?(Class)).to eq true
  end
  it 'should be dead at the age of 10' do
    9.times { subject.age! }
    expect(subject).to_not be_dead
    subject.age!
    expect(subject).to be_dead
  end
  it 'should not have any apples at birth' do
    expect(subject.any_apples?).to eq false
  end
  it 'should raise an error when picking an empty tree' do
    expect { subject.pick_an_apple! }.to raise_error(NoApplesError)
  end
  it 'should have apples after adding' do
    subject.add_apples
    expect(subject.any_apples?).to eq true
  end
end

describe Fruit do
  it 'should have seeds' do
    expect(subject.has_seeds).to eq true
  end
end

describe Apple do
  it 'should have initialized values' do
    apple = Apple.new('green', 2)
    expect(apple.color).to eq 'green'
    expect(apple.diameter).to eq 2
  end
end
