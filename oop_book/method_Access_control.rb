# Method access control is used through access modifiers
# Purpose of access modifiers is to limit or allow access to 
# in Ruby the things that we want to limit access to are methods defined
# in a class
# In Ruby how access modifiers work is by using the access modifiers
# public, private, and protected
# The public methods are accessible to anyone who either knows the class name
# or the objects name
# The public methods are available for the rest of the program  to use and
# comprise the class's interface (that's how other classes and object will interact with this
# class and its objects).

# private methods 

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(name, age)
    self.name = name
    self.age = age
  end

  def info
    "#{self.name} in human years is #{human_years}"
  end

  private

  def human_years
    age * DOG_YEARS
  end
end

sparky = GoodDog.new('Sparky', 4)

# puts sparky.human_years # we get an error as the private is not accessible
# private methods are only accessible from other methods in the class

puts sparky.info

# we can only call a private method with the current object