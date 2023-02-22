class Person
  attr_accesor :name

  def initialize(name)
    self.name = name
  end

end



bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
bob.name                  # => 'Robert'