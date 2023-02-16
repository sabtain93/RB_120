# self can refer to different things depending on where it is used
# so far we have seen two clear uses for self
# first one is when we are calling a setter methods within a class
# it is to disambiguate for Ruby between initializing local variables and calling a setter method
# second is to use self for class method definitions

# using self from within an insatnce method
class GoodDog
  attr_accessor :name, :age, :weight

  def initialize(n, a, w)
    self.name = n
    self.age = a
    self.weight = w
  end

  def change_info(n, a, w)
    self.name = n
    self.age = a
    self.weight = w
  end

  def info
    "#{self.name} is #{self.age} years old and weighs #{self.weight} lbs"
  end

  def what_is_self
    self
  end

  def self.this_is_a_class_method
  end
  puts self
end

sparky = GoodDog.new('Sparky', 2, 23)
p sparky.what_is_self   

# at the moment we are using self whenever we call an instance method from within the class
# what does self represent here
# we will create another instance method
# this shows that from within a class when an insatnce method uses self, it referrences
# to the calling object. that in our case is the sparky object
# so from within teh change_info method calling self.name= method is the same as 
# calling sparky.name= from outside the class
# the other use is when we are defining the class methods

# when we call puts and pass self as an argument to it within a class definition but outside
# insatnce method the class name is outputted, this shows that this use of self references to
# the class itself.
# prefixing self to a method definition is the same as defining a method on the class
# So, 'def self.a_method' is <=> to 'def GoodDog.a_method'.
# this is why it is a class method as it being defined on a class

#To be clear
# self, inside an insatnce method, references to the object that invoked that method, the calling
# object

#self outside of an instance method references the class and can be used to define a class method
# so defining a name class method, def self.name() is same as def GoodDog.name()

# self is a way to be explicit of what our program is referencing and what our intentions are
# self changes depending on the scope it is used in 
