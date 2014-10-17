require "tapestry/version"
require "tapestry/assert"
require "tapestry/description"

module Tapestry
  class Test

    def initialize(num_of_tests)
      @num_of_tests = num_of_tests || 0
      plan
    end

    private

    def plan
      print("1..#{@num_of_tests}\n")
    end

  end
end
