class Animal
  def initialize(name)
    @name = name
  end
end

class Cat < Animal
  def speak
    "#{@name} says meowd!"
  end
end

milo = Cat.new('Milo')
puts milo.speak