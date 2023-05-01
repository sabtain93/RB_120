=begin
A Zoo Animal Categorization Application has information about the animals that live in a zoo.

Zebras, hawks, tigers, koalas, and parrots are the animals that can be found in the zoo,
 and each has an animal id, weight, diet, and body temperature.

None of the values of an animal should be accessible by the public. Likewise, 
no values should be altered after an animal is created.

The application tracks the total number of animals that have been created. 
This number is used to assign a unique animal id when a new animal is created.

When an animal is created, its weight will be determined by a #calc_weight method.
 #calc_weight cannot be accessed from outside the class. It will take two arguments,
  an upper and lower weight range appropriate for the particular species.
   The method will randomly determine each animal's weight within the ranges described below,
    inclusive of the upper and lower weight limits.

Zebras weigh between 770-990 pounds
Tigers weigh between 200-680 pounds
Koalas weigh between 10-30 pounds
Hawks weigh between 12-15 pounds
Parrots weigh between 1-3 pounds

All animals are either herbivores or carnivores.

Zebras, koalas, and parrots are herbivores, and their diet consists of vegetation.
Tigers and hawks are carnivores, and their diet consists of meat.

All animals in the zoo will have a body temperature of 'warm-blooded'.

Parrots and hawks can fly, therefore, they should have access to a #fly method.

Zebras and parrots are social creatures and should have access to a #social method.

Tigers and hawks are apex predators and can hunt. Therefore, they should have access 
to a #hunt method that accepts one argument, prey.

If you pass an animal to the #puts method, it should print information about
 the animal in this format:

 ========================
species: Zebra
animal id: 1
weight: 860
diet: vegetation
body temp: warm-blooded
========================
=end
module Flyable
  def fly
    "I can fly"
  end
end

module Socialable
  def social
    "We are social animals"
  end
end

class Animal
  @@number_of_animals = 0

  def initialize
    @@number_of_animals += 1
    @animal_id = @@number_of_animals
    @body_temprature = "warm-blooded"
    @weight = calc_weight(self.class::UPPER, self.class::LOWER)
  end

  def to_s
    puts "======================================"
    puts "species: #{self.class}"
    puts "animal_id: #{animal_id}"
    puts "weight: #{weight}"
    puts "diet: #{diet}"
    puts "body_temprature: #{body_temprature}"
    puts "======================================"
  end

  private

  def calc_weight(upper, lower)
    (upper..lower).to_a.sample
  end

  attr_reader :weight, :body_temprature, :diet, :animal_id
end


class Herbivore < Animal
  def initialize
    super()
    @diet = "vegetation"
  end
end

class Carnivore < Animal
  def initialize
    super()
    @diet = "meat"
  end

  def hunt
    "i can hunt"
  end
end

class Zebras < Herbivore
  UPPER = 770
  LOWER = 990
  include Socialable

end

class Hawks < Carnivore
  UPPER = 12
  LOWER = 15

  include Flyable

end

class Tigers < Carnivore
  UPPER = 200
  LOWER = 680

end

class Koalas < Herbivore
  UPPER = 10
  LOWER = 30

end

class Parrots < Herbivore
  UPPER = 1
  LOWER = 3

  include Flyable
  include Socialable
end

puts Parrots.new.social