# we have created methods that pretain to the instance or object of the class
# The methods that are at the class level are called class methods
# class methods can be called on the class itself
# Without having to instantiate any objects

# when defining a class method we prepend the method with the keyword self

# when we call the class method we use the class name followed by the method name
# we do not need to instantiate any objects

# why do we even need class methods
# class methods are where we put functionality that does not pretain to indiviual objects
# objects contain state, which is tracked through instance variables
# so if we have a method that does not need to deal with states then we just need to deal
# with class methods
class GoodDog
  def initialize(name)
    @name = name
  end

  def self.what_am_i
    "I am GoodDog class!"
  end
end


GoodDog.what_am_i
