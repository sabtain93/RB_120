#The reason our setter emthods did not work is because 
# Ruby thought that we were initializing a local variable
# rather than calling the name=, weight=, or height= methods
# we need to use self.name= to let ruby know that we are calling the setter method
# this tells us that we are calling the setter method and not intializing a local variable
# We can adopt this for getter methods too, though it not required
# prefixing self is not restricted to just accessor methods, we can use it with any instance method
# for example the info is not given to us by the att_accessor, but we can still call it
# using the self.info as it is done below

class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, w, h)
    @name = n
    @weight = w
    @height = h
  end

  def speak
    "#{name} says Arf!"
  end

  def change_info(n, w, h)
    self.name = n
    self.weight = w
    self.height = h
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall"
  end

# calling the instance method info using the self
#  def some_method
#    self.info
#  end
#
end

sparky = GoodDog.new('Sparky', '45lb', '13cm')
puts sparky.info
sparky.change_info('mufasa', '24lbs', '9cm')
puts sparky.info