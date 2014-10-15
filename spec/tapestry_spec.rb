require 'spec_helper'

def capture(stream)
  begin
    stream = stream.to_s
    eval "$#{stream} = StringIO.new"
    yield
    result = eval("$#{stream}").string
  ensure
    eval("$#{stream} = #{stream.upcase}")
  end
  result
end


describe Tapestry do

  it 'has a version number' do
    expect(Tapestry::VERSION).not_to be nil
  end

  it 'Tapestry::Test.new' do
    stdout = capture(:stdout) {
      Tapestry::Test.new(5)
    }
    expect(stdout).to eq("1..5\n")
  end

  it 'tapestry.equal (ok)' do
    tapestry = Tapestry::Test.new(1)
    stdout = capture(:stdout) {
      tapestry.equal(1, 1, 'tapestry.equal(): ok test', 1)
    }
    expect(stdout).to eq("ok 1\n# tapestry.equal(): ok test")
  end

  it 'tapestry.equal (not ok)' do
    tapestry = Tapestry::Test.new(1)
    stdout = capture(:stdout) {
      tapestry.equal(1, 2, 'tapestry.equal(): not ok test', 2)
    }
    expect(stdout).to eq("not ok 2\n# tapestry.equal(): not ok test ---\n    actual:   2\n  expected:   1\n ---\n")
  end

  it 'tapestry.dont_equal (ok)' do
    tapestry = Tapestry::Test.new(1)
    stdout = capture(:stdout) {
      tapestry.dont_equal(1, 2, 'tapestry.dont_equal(): ok test', 3)
    }
    expect(stdout).to eq("ok 3\n# tapestry.dont_equal(): ok test")
  end

  it 'tapestry.dont_equal (not ok)' do
    tapestry = Tapestry::Test.new(1)
    stdout = capture(:stdout) {
      tapestry.dont_equal(1, 1, 'tapestry.dont_equal(): not ok test', 4)
    }
    expect(stdout).to eq("not ok 4\n# tapestry.dont_equal(): not ok test ---\n    actual:   1\n  expected:   1\n ---\n")
  end

end
