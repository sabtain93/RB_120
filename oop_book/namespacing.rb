# namespacing is to organize similar classes under a module
# We will use modules to group related classes
# Namespacing makes it easy to recognize related classes in our code
# secind advantage is that it help in reducing the the possibility of the classes colliding
# with other similarly named classes

# example

module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end

  def self.some_out_of_palce_method(num)    # module method
    num ** 2
  end
end

# we call classes within a module by appending the class name to the module name with two colons

sparky = Mammal::Dog.new
paws = Mammal::Cat.new

sparky.speak("Arf!")
paws.say_name("Paws")

# The second using modules as container for methods called module methods
# This involves housing methods that seem out of place
# the module methods are defined with using self
# the method then can be called on the module

puts Mammal.some_out_of_palce_method(4)
