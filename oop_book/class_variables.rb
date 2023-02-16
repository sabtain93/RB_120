# just as instance variables capture certain instance of classes(that are objects)
# we can create for an entire class
# appropriatelyn named class variables
# class variables are created with prepending two @@

class GoodDog
  @@number_of_dogs = 0

  def initialize
    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs

# In the above code we have a class variable `@@number_of_dogs`
# which we initialize to 0
# Then in our constructor we increment that number by 1
# The initialize instant method gets called every time we instantiate a new object
# via the `new` method.
# this also demonstrates that we can access the class variables from within the instance methods
# finally we just return the value of the class variable in the class method `self.total_number_of_dogs`
# Here we used the class variable and class methods to keep track of class level detail that pretains
# only to class and not to indiviual objects