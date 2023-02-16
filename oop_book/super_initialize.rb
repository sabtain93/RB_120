# another way to use super is with initialize

class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new('brown')
p bruno

=begin
here we are using super with no arguments. however the initialize method where super is begin used
takes one argument. Here super other than it default behaviour, super automatically forwards the
arguments that were passed to the method from which super is called.
Now super will pass the color argument in the initialize defined in the subclass to that of Animal
superclass and invoke it.
This explains the presence of @name = "brown" when bruno instance is creatred
Finally the subclass' initialize continues to set the @color instance variable


=end