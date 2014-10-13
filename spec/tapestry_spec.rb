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
      tapestry.equal(1, 1, 'ok test', 1)
    }
    expect(stdout).to eq("ok 1\n# ok test")
  end

  it 'tapestry.equal (not ok)' do
    tapestry = Tapestry::Test.new(1)
    stdout = capture(:stdout) {
      tapestry.equal(1, 2, 'not ok test', 2)
    }
    expect(stdout).to eq("not ok 2\n# not ok test ---\n    actual:   2\n  expected:   1\n ---\n")
  end
end
