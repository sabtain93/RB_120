class GoodDog
  def initialize
    puts 'This object was initialized'
  end
end

sparky = GoodDog.new

=begin
The initilaize method gets called every time we create a new object.
By calling the `new` class method eventually leads us to the `initialize` instance method
There is a difference between a class method and an instance method.
In the above code by instantiating a new GoodDog object triggered the `initialize` method and
resulted in the string beign outputted.
We refere to the `initialize` method as a consturctor, because it builds the object when
a new object is instantiated. It is triggered by the `new` calss method.

=end