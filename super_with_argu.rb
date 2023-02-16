# when super is called with specific arguments super(a, b)
# the specified arguments will be sent up the method lookup chain


class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

p BadDog.new(2, 'baloo')

# In the above code super takes an argument and the passed in argument is sent to the superclass
# when BadDog instance is created, the passed in name argument is passed to the superclass
# and set to the @name instance variable
# if there is a method that takes no argument in the superclass then we use super(), this way no
# arguments are passed in
# if parathese is not used an error will be raised