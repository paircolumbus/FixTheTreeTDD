require 'rspec'
require_relative '../lib/tree'

describe Tree do
let(:script) { Tree.new }
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  describe "#age!" do
    it 'ages the tree' do
      script.age!
      expect(script.age).to eq(1)
    end
  end

  describe "#add_apples" do
    it 'adds apples to the tree' do
      expect(script.add_apples).to eq(3)
    end
  end

  describe "#any_apples?" do

    context 'when no apples' do
      it 'returns false' do
        expect(script.any_apples?).to eq(false)
      end
    end

    context 'when has apples' do
      before do
        3.times { script.apples << Apple.new(rand(4..20)) }
      end

      it 'returns true' do
        expect(script.any_apples?).to eq(true)
      end
    end
  end

  describe "#pick_an_apple!" do

    context 'when no apples' do
      it 'raises no apple error' do
        expect{script.pick_an_apple!}.to raise_error(NoApplesError)
      end
    end

    context 'when has apples' do
      before do
        3.times { script.apples << Apple.new(1) }
      end

      it 'removes an apple' do
        script.pick_an_apple!
        expect(script.apples.count).to eq(2)
      end
    end
  end

    describe "#dead?" do
      it 'returns true if dead' do
        expect(script.dead?).to eq(false)
      end
    end
  end

describe Fruit do
let(:script) { Fruit.new }
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end
end

describe Apple do
let(:script) { Apple.new }
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end
end
