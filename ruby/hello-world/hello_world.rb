class HelloWorld
  def self.hello(name="no name")
    if name != "no name"
      "Hello, #{name}!"
    else
      "Hello, World!"
    end
  end
end


# puts HelloWorld.hello