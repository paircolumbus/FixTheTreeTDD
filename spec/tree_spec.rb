require 'rspec'
require 'trees/tree'
require 'trees/history/tree_data'
require 'trees/history/tree_history'

describe Tree do
  context "Tree with history" do
    let(:tree_details) { [1, 2, 4, 6, 7].map { |height| TreeData.new(height) } }
    let(:history) { TreeHistory.new(tree_details) }
    let(:tree) { Tree.new(history) }

    it "should live 5 years" do
      expect(tree.dead?).to eq false
      expect(tree.age).to eq 0

      (tree_details.length + 1).times { tree.age! }
      expect(tree.dead?).to eq true
    end

    it "should change height each year" do
      # Tree starts at height 0, age 0
      expect(tree.height).to eq 0

      tree_details.each do |year|
        tree.age!
        expect(tree.height).to eq year.height
      end
    end
  end
end


