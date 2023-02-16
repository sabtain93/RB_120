# Add a class method to your MyCar class that calculates the gas mileage of any car.

class MyCar
  attr_accessor :year, :color, :model, :speed

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end

  def speed_up(number)
    @speed += number
    puts "You push the gas and accelerate #{number} km/h"
  end

  def brake(number)
    @speed -= number
    puts "You pressed the brakes and decelerate #{number} km/h"
  end
  def current_speed
    puts "You are accelerating at #{@speed} km/h"
  end

  def shut_off
    @speed = 0
    puts "You truned off the car"
  end

  def spray_paint(c)
    self.color = c
    puts "You have changed the color of your car to #{@color}"
  end

  def to_s
    "My #{color} #{model}'s manufacturing year is #{year}"
  end

  def self.gas_mileage(gallons, miles)
    "#{miles / gallons} mile per gallon of gas"
  end
end

civic = MyCar.new(2020, 'blue', 'honda civic')
puts civic

