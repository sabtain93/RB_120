=begin
Create a class called MyCar. When you initialize a new instance or object of the class,
allow the user to define some instance variables that tell us the year, color,
and model of the car. Create an instance variable that is set to 0 during instantiation
of the object to track the current speed of the car as well. Create instance methods that
allow the car to speed up, brake, and shut the car off.
=end


class MyCar
  attr_accessor :year, :color, :model, :speed

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end

  def speed_up(number)
    self.speed += number
    puts "You push the gas and accelerate #{number} km/h"
  end

  def brake(number)
    self.speed -= number
    puts "You pressed the brakes and decelerate #{number} km/h"
  end
  def current_speed
    puts "You are accelerating at #{speed} km/h"
  end

  def shut_off
    self.speed = 0
    puts "You truned off the car"
  end

end

print "Enter the year of the car: "
y = gets.chomp
print "Enter the color of the car: "
c = gets.chomp
print "Enter the model of the car: "
m = gets.chomp
puts ''

car = MyCar.new(y, c, m)

car.current_speed

car.speed_up(20)

car.current_speed

car.speed_up(20)

car.current_speed

car.brake(20)

car.current_speed

car.brake(20)

car.current_speed

car.shut_off