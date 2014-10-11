module Tapestry
  class Test

    def equal(expected, actual, msg, test_num)
      test_num = '' unless test_num

      if expected == actual
        p 'ok ' + test_num.to_s
      else
        p 'not ok ' + test_num.to_s
      end

      p '# ' + msg if msg != ''

      result(expected actual) if expected != actual
    end

    alias_method :equals, :equal
    alias_method :is, :equal
    alias_method :is_equal_to, :equal
    alias_method :is_equal_in, :equal

    private

    def result(expected, actual)
      p ' ---'
      p '  actual:   ' + actual.to_s
      p '  expected: ' + expected.to_s
      p ' ---'
    end

  end
end
