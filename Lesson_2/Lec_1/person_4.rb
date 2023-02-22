class Person
  attr_accessor :first_name, :last_name

  def initialize(fn)
    parts = fn.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end

  def name
    "#{first_name} #{last_name}"
  end

  def name=(fn)
    parts = fn.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

puts bob.name == rob.name