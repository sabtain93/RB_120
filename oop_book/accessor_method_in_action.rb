class GoodDog
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{name} say Arf!" # was "#{@name} say Arf!"
  end                   # by changing it to name now we are calling the instance method
end

sparky = GoodDog.new('Sparky')
puts sparky.name
puts sparky.speak

#with getter and setter methods we have a way to expose and change an object's state.
# we can use these setter and getter methods from within the class
# In the above code we referene the instance variable @name rom within the 
# speak method
# instead of using the instance variable directly we can use the name getter method
# that was created and now is given to us by the att_accessor method
# we can change the speak method as such
# it is generally a good idea to call teh setter method rather than referencing the
# instance variable.
# it is better to reference the getter method as if we do not want to expose the entire data
# stored in the instance variable
# we will now make a getter method and make changes in it and reference the getter method rather
# than the instance variable
# it is easier to change the getter method rather than the whole code where is the instance
# variable is referenced
# We should do the same with the setter method, wherever we are changing the instance variable
# directly in our class we should use the setter method instead.

