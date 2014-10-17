module Tapestry
  class Test

    def description(msg)
      print(msg.to_s + "\n")
    end

    alias_method :message, :description
    alias_method :echo, :description

  end
end
