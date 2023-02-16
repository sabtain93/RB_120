=begin

Create a module that you can mix in to ONE of your subclasses that describes a behavior
unique to that subclass.

=end
module Towable
  def can_tow?(tons)
    tons <= 10
  end
end


class Vehicle
  attr_accessor :color, :model, :year

  @@number_of_vehicles = 0

  def initialize(model, year, color)
    @@number_of_vehicles += 1
    self.model = model
    self.year = year
    self.color = color
    @current_speed = 0
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks good"
  end

  def self.number_of_vehicles
    puts @@number_of_vehicles
  end

  def self.gas_mileage(miles, gallons)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def speed_up(number)
    @current_speed += number
    puts "you pushed the gas and accelerate #{number} mph"
  end

  def brake(number)
    @current_speed -= number
    puts "you pressed the brake and decelrate #{number} mph"
  end

  def current_speed
    puts "you are accelerating at #{@current_speed} mph"
  end

  def shut_down
    @current_speed = 0
    puts "You turned off the engine"
  end
end


class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is #{self.color}, #{self.year}, #{self.model}!"
  end
end

class MyTruck < Vehicle
  include Towable
  NUMBER_OF_DOORS = 2

  def to_s
    "My truck is #{self.color}, #{self.year}, #{self.model}!"
  end

end

civic = MyCar.new('Honda civic', 2020, 'blue')
civic.speed_up(20)
civic.current_speed
civic.speed_up(20)
civic.current_speed
civic.brake(20)
civic.current_speed
civic.brake(20)
civic.current_speed
civic.shut_down


ford = MyTruck.new('Ford SUV', 2009, 'black')

ford.speed_up(20)
ford.current_speed
ford.speed_up(20)
ford.current_speed
ford.brake(20)
ford.current_speed
ford.brake(20)
ford.current_speed
ford.shut_down


