# the to_s method comes built in every class in ruby
#

class GoodDog
  DOG_YEARS = 7
  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a * DOG_YEARS
  end

  def to_s
    "This dog's name is #{name} and it is #{age} in dog years"
  end
end

sparky = GoodDog.new('Sparky', 4)


# here the puts method automatically call the to_s method on its arguments
# which in our case is the sparky object
# so puts sparky <=> puts sparky.to_s
# by default the to_s method returns the name of the object's class and an encoding of the
# object id

# puts method calls to_s for any argument that is not an array
# in case of an array it writes on seprate lines the result of calling to_s on each element
# of the array

# we can override the default to_s method by adding a custom to_s method in our class
# we were able to override the to_s instance method

# there is a similar method to puts that is p
# but the difference that p calls another built in instance method inspect on its argument
# the inspect insatnce method is very helpful with the debugging

# when using string interpolation the to_s method is automatically called
# example:
# array = [1, 2, 3]
# x = 5
# "the #{array} does not include #{x}"
# return : the [1, 2, 3] does not include 5
# here the to_s method is automatically called on array array object and x integer object 
# we can do the same with sparky
# "#{sparky}"
# return: "this dog's name is Sparky and it is 28 in dog years"
# the to_s method is automatically called on object when we use it with puts  or when
# used with string interpolation
# knowing when to_s is called helps us better understand OO code
#