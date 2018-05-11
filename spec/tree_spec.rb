require 'rspec'
require_relative '../lib/tree'

describe Tree do
  it 'should be a Class' do
    expect(described_class.is_a? Class).to eq true
  end

  let(:t) { Tree.new }

    it 'is initaialized with expected values for attributes' do
      expect(t.age).to eq 0
      expect(t.height).to eq 0
      expect(t.apples).to eq []
      expect(t.alive).to be(true)
    end

    it 'ages' do
      t.age!
      expect(t.age).to eq 1
      expect(t.apples).to eq []
    end

    it 'does not produce apples for first 2 years' do
      2.times { t.age! }
      expect(t.apples).to eq []
    end

    it 'produces 5 apples when aged 3 years' do
      3.times { t.age! }
      expect(t.apples.count).to eq 15
    end

    it 'can be picked for apples' do
      3.times { t.age! }
      t.pick_an_apple!
      expect(t.apples).not_to be_empty
    end

    it 'dies when it ages beyond 12 years' do
      13.times { t.age! }
      expect(t.alive).to be(false)
    end
end

describe 'Fruit' do
  it "should have seeds" do
    f = Fruit.new
    expect(f.has_seeds).to be(true)
  end
end

describe 'Apple' do

  let(:a) { Apple.new("red", 2) }

  it "has super class' attributes" do
    expect(a.has_seeds).to be(true)
  end

  it "is red" do
    expect(a.color).to eq ("red")
  end

  it "has a diameter" do
    expect(a.diameter).to eq 2
  end

end
