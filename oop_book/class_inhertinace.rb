# we will be extecting the speak method from the GoodDog class to the superclass 'Animal'
# we use inheritance to make it available to the GoodDog and Cat classes.
# 

class Animal
  def speak
    "Hello"
  end
end

class GoodDog < Animal
  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  def speak
    "#{self.name} says Arf!"
  end
end

class Cat < Animal
end

sparky = GoodDog.new('sparky')
paws = Cat.new

puts sparky.speak
puts paws.speak

# We use the < symbol that GoodDog class is inherting from the Animal class
# This means that all the methods in animal class are available to the GoodDog class for use
# Cat is also a class that inherits from the Animal class
# when we run this code both the classes are using the superclass Animal's speak method
# now lets add it back the speak method to GoodDog class

# here in the GoodDog class we are overriding the speak method from the Animal class
# this is because Ruby checks the objects class first before it looks into the superclass.
# Inhertitance is a great way to remove duplication in our code base
#