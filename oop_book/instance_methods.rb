# giving behaviour to the object sparky from the GoodDog class

class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says Arf!"
  end
end

sparky = GoodDog.new("Sparky")

puts sparky.speak # calling the instance method of the GoodDog class on its object sparky
             # nothing is printed out as the instance method returns the string `"arf"`
# we add the puts in fornt of it.
# now we create another GoodDog object fido
fido = GoodDog.new("Fido")
puts fido.speak

#this tells us that all objects of the same class have the same behaviours,
# though they contain different states; here the differing state is the name
# In our instance methods we have access to instance variables
# by using string interpolation we can change the above code so when we call the speak instance
# method on the GoodDog object it will output the name of the object which is referenced by the
# @name instance variable.
# now we can expose the state of the object using the instance methods