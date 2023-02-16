# when creating classes there are variables that you do not want to change
# we can do this by creating constants

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a * DOG_YEARS
  end
end

sparky = GoodDog.new('Sparky', 4)
puts sparky.age

# In the above code we used the constant DOG_YEARS to calculate the age in dog years when we created
# thte object sparky.
# we use the setter methods in the initialize method to initialize the @name, @age instance variables
# given to us by the attr_accessor method.
# we then used the age getter method to retrieve the value from the object
# DOG_YEARS is a variable that will never change for any reason and so we use a constant.
# It is possible to reassign a constant but Ruby will throw a warning.


