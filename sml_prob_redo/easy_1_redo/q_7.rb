class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = mileage + miles
    self.mileage = total
  end

  def print_mileage
    puts mileage
  end
end

car = Car.new
car.mileage = 5000
car.increment_mileage(678)
car.print_mileage  # should print 5678

# Line 221 prints 5000 instead of 5678, because on line 10 when we are updating the 
# value referenced by @milage instead of calling the setter method for the @mileage
# we initiliaze a local variable milage, so to access the setter methdo we need to add
# an explicit caller by adding `self` infornt of `mileage`.
