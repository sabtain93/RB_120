class GoodDog
  attr_accessor :name

  def initialize(n)
    @name = n
  end

  # def name          # this was get_name
  #   @name
  # end

  # def name=(n)            # this was set_name=()
  #   @name = n
  #   'mustafa'             # this is ignored
  # end

  def speak
    "#{@name} says Arf!"
  end
end


sparky = GoodDog.new('Sparky')
puts sparky.speak
puts sparky.name
sparky.name = 'mufasa'
puts sparky.name

# # fido = GoodDog.new('Fido')
# puts fido.speak

# what if we wanted to only sparky's name

#puts sparky.name this outputs an error
# if we want to access the object's name which is stored in the @name instance variable
# we have to create method that return the name
# We can call it get_name, and its only job is to return the value in the @name instance
# variable

# By adding the get_name method we get the name of the object and we have a getter method
# Now if we wanted to change sparky's name, so now we need a setter method
# now adding the setter method
# in the above code the `set_name=` is the method name and normally we can use it as
# `set_name=('mufasa')` where the `set_name=` is the entire method name and the string
# `mufasa` is passed to it as an argument. Ruby recognizes this is a setter method and
# allows us to use a more natural assignment syntax `sparky.set_name = 'mufasa' this is
# Ruby syntactical sugar
# now as a convention, Rubyist like to name those getter and setter methods using the same name
# as of the instance variable they are exposing and setting
# setter method always returns the value that is passed to it as an argument
# if the setter method tries to return anyother value it is just ignored
# writing those setter and getter methods with such simple feature took alot of room
# what if there were other states like height weight we wanted to track
# As these methods are so common place that Ruby has a built in way to automatically create 
# these setter and getter methods for us
# using the attr_accessor method
# the atte_accessor method takes a symbol as an argument which it takes to create the method
# name for our setter and getter methods.
# what fi we wanted a getter method without a setter method we would use the attr_reader method
# the attr_reader method only allows us to retrieve the instance variable
# if we only wanted to use the setter method we would use the attr_writer method.
# all the attr_* methods take Symbol objects as arguments
# if there are more than one state we are tracking we can use the below syntax

# attr_accessor :name, :height, :weight







