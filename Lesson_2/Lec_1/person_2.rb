class Person
  attr_accessor :first_name, :last_name

  def initialize(fn)
    parts = fn.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ""
  end

  def name
    "#{first_name} #{last_name}"
  end
end

bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'