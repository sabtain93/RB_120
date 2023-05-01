class Pet

  def initialize(type, name)
    @type = type
    @name = name
  end

  def to_s
    "a #{type} named #{name}"
  end

  private
  attr_accessor :type, :name
end

class Owner
  attr_reader :name
  def initialize(name)
    @name = name
    @pets = []
  end

  def <<(pet)
    @pets.push(pet)
  end

  def number_of_pets
    @pets.size
  end

  def to_s
    @name
  end
end

class Shelter

  def initialize
    @adoptions = {}
  end

  def adopt(owner, pet)
    owner << pet
    @adoptions.key?(owner) ? @adoptions[owner] << pet : @adoptions[owner] = [pet]
  end

  def print_adoptions
    @adoptions.each do |owner, pets|
      puts "#{owner} has adopted the following pets:"
      pets.each do |pet|
        puts pet
      end
    puts ""
    end
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
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
 puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."