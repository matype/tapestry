require "tapestry/version"
require "tapestry/assert"

module Tapestry
  class Test

    def initialize(num_of_tests)
      @num_of_tests = number_of_tests ||= 0
      plan
    end

    private

    def plan
      p '1..' + @num_of_tests.to_s
    end

  end
end
