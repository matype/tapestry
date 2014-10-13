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
end
