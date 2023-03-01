class Pet
  
  def initialize(animal, name)
    @animal = animal
    @name = name
  end

  def to_s
    "a #{@animal} named #{@name}"
  end
end

class Owner
  attr_reader :name, :number_of_pets
  def initialize(name)
    @name = name
    @number_of_pets = 0
  end

  def to_s
    name
  end

  def add_pets
    @number_of_pets += 1
  end
end

class Shelter
  def initialize
    @adoptions = Hash.new([])
  end

  def adopt(person, pet)
    @adoptions.has_key?(person) ? @adoptions[person] << pet : @adoptions[person] = [pet]
    person.add_pets
  end

  def print_adoptions
    names = @adoptions.keys
    puts "#{names.first} has adopted the following pets"
    @adoptions[names.first].each {|pet| puts pet }
    puts ""
    puts "#{names.last} has adopted the following pets"
    @adoptions[names.last].each {|pet| puts pet }
  end

end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts ""
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."