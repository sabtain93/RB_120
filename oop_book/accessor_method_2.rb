# now what if added more states to track to the GoodDog class
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says Arf!"
  end

  # now we want to add a change_info method that allows us to change several states at once
  def change_info(n, h, w)
    name = n
    height = h
    weight = w
  end

# now we add a info method just to print out the states of the object
  def info
    "#{name} weighs #{weight} and is #{height} tall"
  end
end

sparky = GoodDog.new('Sparky', '28 cm', '10 lbs')
puts sparky.info
sparky.change_info('mufasa', '32 cm', '15 lbs')
puts sparky.info

# just like when we replaced accessing the instance variable with the getter methods,
# we will do the same with our setter methods
# now we will replace the chang_info method
# this doesnot work