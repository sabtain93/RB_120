class GoodDog
  def initialize(name)
    @name = name
  end
end

sparky = GoodDog.new("Sparky")

=begin
In the above code the `@name` is an instance variable
The instance variable exists as long as the object instance exists and it is one way of how we 
can tie data to objects.
The instance variable does not die after the initialize method is run, it lives on to be 
referenced, until the object instance is destroyed.
In the above code the initialize method is defined with one parameter
we can pass arguments into the initialize method through the new method.
On line `7` the string "Sparky" is begin passed from the new method through to the initialize method
and is assigned to the local variable name. Within the constructor, when we set @name to name, this
results in assigning the string "Sparky" to the @name instance variable.
From the above example we can see that the insatnce variable are responsible for keeping track of
information of the state of the object.
In the above code the name of the object `sparky` is the string "Sparky". This state for the object
is tracked in the instance variable @name.
If we created another GoodDog object for example `fido = GoodDog.new('Fido'), then the @name
instance variable for `fido` object would contain the string 'Fido'.

Every object's state is distinct, and instance variable is how we keep track.
=end