# Add an accessor method to your MyCar class to change and view the color of your car.
# Then add an accessor method that allows you to view, but not modify, the year of your car.


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

  def change_color(c)
    @color = c
    puts "you have changed the color of the car to #{@color}"
  end

  def year_of_car
    puts "the year of your car is #{@year}"
  end
end

car1 = MyCar.new(2009, 'black', 'honda civic')

car1.color = ('blue')
puts car1.color
puts car1.year