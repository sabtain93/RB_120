class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(n)
    self.name = n
  end
end

kitty = Cat.new('Sophie')
puts kitty.name
kitty.rename('Chloe')
puts kitty.name