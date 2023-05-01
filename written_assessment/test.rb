class Person
  def name=(name)
    @name = name
  end

  def set_name(name)
    self.name = name
  end
end

person1 = Person.new

person1.set_name('sabatin')

p person1