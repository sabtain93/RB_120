# You want to create a nice interface that allows you to accurately describe the action you want
#your program to perform.
#Create a method called spray_paint that can be called on an object and will modify the 
#color of the car.


class MyCar
  attr_accessor :color
  attr_reader :year


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

end

civic = MyCar.new(2020, 'black', 'honda civic')
civic.spray_paint('blue')

