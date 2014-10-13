module Tapestry
  class Test

    def equal(expected, actual, msg, test_num)
      test_num = '' unless test_num

      if expected == actual
        print("ok #{test_num}\n")
      else
        print("not ok #{test_num}\n")
      end

      print("# #{msg}") if msg != ''

      result(expected, actual) if expected != actual
    end

    alias_method :equals, :equal
    alias_method :is, :equal
    alias_method :is_equal_to, :equal
    alias_method :is_equal_in, :equal

    private

    def result(expected, actual)
      print(" ---\n")
      print("    actual:   #{actual}\n")
      print("  expected:   #{expected}\n")
      print(" ---\n")
    end

  end
end
