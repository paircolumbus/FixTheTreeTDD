require_relative 'apple_tree'

class TreeReporter
  def avg(nums)
    nums.reduce(:+) / nums.size.to_f
  end

  def tree_data(tree_details)
    report = []

    tree = AppleTree.new("n/a", tree_details)

    tree.age! until tree.any_apples?

    report << "Tree is #{tree.age} years old and #{tree.height} feet tall"

    until tree.dead?
      basket = []

      # It places the apple in the basket
      while tree.any_apples?
        basket << tree.pick_an_apple!
      end

      avg_diameter = avg basket.map { |apple| apple.diameter }

      report << "Year #{tree.age} Report"
      report << "Tree height: #{tree.height} feet"
      report << "Harvest:     #{basket.size} apples with an average diameter of #{avg_diameter.round(2)} inches"
      report << ""

      # Ages the tree another year
      tree.age!
    end

    report << "Alas, the tree, she is dead!"

    return report
  end
end

