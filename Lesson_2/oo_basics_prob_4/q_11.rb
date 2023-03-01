class Person
  def name=(full_name)
    parts = full_name.split
    @firts_name = parts.first
    @last_name = parts.last
  end

  def name
    "#{@firts_name} #{@last_name}"
  end
end


person1 = Person.new
person1.name = 'John Doe'
puts person1.name