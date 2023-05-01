module Drivable
  def self.drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive

=begin
q- Make the smallest possible change so that cars have access to the `drive` method

`Car` can access the `drive` method by modifying it from `self.drive` to `drive`.

Methods in mixin modules should be defined without `self. As if we do define methods with `self`
the class that includes the module can only access the method by calling `Drivable.drive` and the
method is not available as an instance method to the objects.
=end