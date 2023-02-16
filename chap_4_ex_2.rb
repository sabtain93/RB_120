=begin
Add a class variable to your superclass that can keep track of the number of objects created
that inherit from the superclass.
Create a method to print out the value of this class variable as well.

=end

class Vehicle
  @@number_of_vehicles = 0

  def initialize
    @@number_of_vehicles += 1
  end

  def self.number_of_vehicles
    puts @@number_of_vehicles
  end

  def self.gas_mileage(miles, gallons)
    puts "#{miles / gallons} miles per gallon of gas"
  end
end


class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
end

MyCar.new
MyTruck.new

Vehicle.number_of_vehicles