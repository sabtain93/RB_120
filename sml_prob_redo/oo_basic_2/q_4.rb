class Cat
  attr_reader :name
  def self.generic_greeting
    puts "Hello! I'm a #{self}."
  end

  def initialize(name)
    @name = name
  end

  def personal_greeting
    puts "Hello! my name is #{name}"
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting