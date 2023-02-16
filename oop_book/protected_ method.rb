
# protected
# protected method is similar to private method
# the similarity is that they both cannot be called from outside the class
# the difference is that a protected method allow access between insatnces of the same class

class Person
  def initialize(age)
    @age = age
  end

  def older?(other_person)
    age > other_person.age
  end

  protected

  attr_reader :age
end

mustafa = Person.new(12)
sabtain = Person.new(41)

puts mustafa.older?(sabtain)
puts sabtain.older?(mustafa)

# This shows that protected method cannot be accessed from outside the class
# unlike private methods, other instances of the class can also invoke the method
# this provides controlled access, but wider access between objects of the same class type