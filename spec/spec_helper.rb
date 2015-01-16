require 'rspec'
require 'tree'

RSpec.configure do |c|
	c.formatter = :documentation
	c.color = :enabled
	c.fail_fast = true
end