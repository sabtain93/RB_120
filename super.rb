# Ruby uses the keyword super to call methods earlier in the method lookup path
# When we call super from within a method it searches the method look up path for
# a method of the same name then invokes it
#

class Animal
  def speak
    'Hello!'
  end
end

class GoodDog < Animal
  def speak
    super + " from GoodDog class"
  end
end

sparky = GoodDog.new
puts sparky.speak

# In the above code we created a simple Animal class with speak insatnce method
# then we created a GoodDog class which subclasses Animal also with a speak instance 
# method to override the inherited version
# in the subclass speak method we use speak to invoke the speak method from the superclass
# then we extend the functionality by appending some text to the return value