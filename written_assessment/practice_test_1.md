# Practice Test 1

---

1

```ruby
class Person
  attr_reader :name
  
  def set_name
    @name = 'Bob'
  end
end

bob = Person.new
p bob.name
```
_What is output and why? What does this demonstrate about instance variables that differentiates them from local variables?_
line xx ouptus `nil`. This is because `bob.name` the getter method is called `Person#name` which returns the value referenced by `@name` instance variable which is not initialized so `nil` is returned.

this demonstrates that accessing unintialized instance variables `nil` is retruned and if an initialized local variable is referenced Ruby raises an error. This is what distinguishes instance variables from local variables.
---

2

```ruby
module Swimmable
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swimmable

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
p teddy.swim   
```
_What is output and why? What does this demonstrate about instance variables?_

line xxx outputs `nil`. This is because the within the `#swim` instance method beign called on object `teddy`, the `if` conditional evaluates to false, as `@can_swim` instance variable is not yet initialized and so `nil` is returned.

This demonstrates that insatnce variables are to be initialized by invoking the method in which it initializes and then it can be accessed by the instance and `nil` is returned for uninitialized instance variables.
---

3

```ruby
module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end
  
  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides 
p Square.new.sides 
p Square.new.describe_shape 
```

_What is output and why? What does this demonstrate about constant scope? What does `self` refer to in each of the 3 methods above?_
 line xxx outputs `4`
 line xxx outputs `4`
 line xxx raises an error becasue of the `SIDES` consatnt reference within the `describe_shape`. Ruby resolves this constant by searching in module `Describable` and it not defined here, then it looks in the modules's inheritance heirarcy and as there is none so it looks next in the main scope and as it does not find it defined there too a error is raised.

 This demonstrates that consatnts have a lexical scope and Ruby resolves the constant reference by looking in the lexical scope of the consatnt reference then in the constant lookup path and at the end in the main scope. We can tell Ruby where to find the consatnt by using prefixing the class name followed by the constant resolution operatror `::`.


---

4

```ruby
class AnimalClass
  attr_accessor :name, :animals
  
  def initialize(name)
    @name = name
    @animals = []
  end
  
  def <<(animal)
    animals << animal
  end
  
  def +(other_class)
    animals + other_class.animals
  end
end

class Animal
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

mammals = AnimalClass.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

birds = AnimalClass.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')

some_animal_classes = mammals + birds

p some_animal_classes 
```

_What is output? Is this what we would expect when using `AnimalClass#+`? If not, how could we adjust the implementation of `AnimalClass#+` to be more in line with what we'd expect the method to return?_

The output is an array object which consists of all the object from the array referenced by `mammals` object's `@animal` and `bird` object's `@animal`.

Conventially the `#+` method concatenates or increment the calling object and the object passed in as an argument and return a new object of the calling object type. But `AnimalCalss#+` returns a new array object, this is not how we expect it to work.

To be more in line with the implementation of the `#+` we can create a new object of `AnimalClass` and then initialize the new object's `@animal` insatnce variable to the return value of `animal + other.animal` and return teh new object.
---

5

```ruby
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    name = n
    height = h
    weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end


sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs') 
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info 
# => Spartacus weighs 10 lbs and is 12 inches tall.
```

_We expect the code above to output `”Spartacus weighs 45 lbs and is 24 inches tall.”` Why does our `change_info` method not work as expected?_

As within the `cahnge_info` instance method we are simply initializing three new local variables rather then setting the instance variables. As the setter methods for each instance variable is provided by `attr_accessor` on line xxx, we can call the setter mthods by prefixing `self.` on each line within `change_info`. By calling the setter method on `self` lets ruby diffrentiate between calling a setter method and initializing a local variable.
---

6

```ruby
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def change_name
    name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name 
bob.change_name
p bob.name
```

_In the code above, we hope to output `'BOB'` on `line 16`. Instead, we raise an error. Why? How could we adjust this code to output `'BOB'`?_

line xxx raises an error because within the `change_name` method beign invoked a `name` local variable is being initialzied rather than calling teh setter method `#name=`. So by initializing `name` and then referencing it on the same line shadows the `#name` getter method and as the `name` local variable is not yet initialized the error is raised.

We can adjust this by prefixing `self.` on line xxx so ruby can distinguish between calling the setter method and initializing a local variable.
---

7

```ruby
class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels                             

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels                           
p Vehicle.wheels                              

class Car < Vehicle; end

p Vehicle.wheels
p Motorcycle.wheels                           
p Car.wheels
```

_What does the code above output, and why? What does this demonstrate about class variables, and why we should avoid using class variables when working with inheritance?_
 line xxx outouts `4`, line xxx outputs `2`, then line xxx `2`, line xxx `2`...

 class variables are loaded when the class is evaluated by Ruby. So when the second class is evaluated the `@@wheels` class variables is reassigned this because the class and all its subclasses share a single copy of the class variable. By reassigning the class variable in the subclass reassigns it in the supoerclass, this is why the use of class variabels are to be avioded when working with inheritance.
---

8

```ruby
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

bruno = GoodDog.new("brown")       
p bruno
```

_What is output and why? What does this demonstrate about `super`?_

The output is `#<GoodDog:0x0565c0c8 @name="brown", @color="brown">`. When on line xxx `super` si invoked it calls the `Animal#initialize` and passes the string `brown` referenced by `color` to it and so `@name` insatnce variable is assigned to `brown` and within the `GoodDog#initialize` the `@color` si assigned to teh same string `brown`.

This demosnstartes that when `super` is invoked without paranthese or without specific arguments within the paranthese all the arguments passed to the instance method in which it is invoked are forwared to the instance method of the same name defined in its superclass.

---

9

```ruby
class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super
    @color = color
  end
end

bear = Bear.new("black")
```

_What is output and why? What does this demonstrate about `super`?_

line xxx raises an error. This is because on line xxx when `super` is invoked which calls the `Animal#initialize` and passes all the arguments that are passed to `Bear#initialize`, and as `Animal#initialize` does not expect any arguments an error si raised.

This demosnstartes that when `super` is invoked without paranthese or without specific arguments within the paranthese all the arguments passed to the instance method in which it is invoked are forwared to the instance method of the same name defined in its superclass.

---

10

```ruby
module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

module Danceable
  def dance
    "I'm dancing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end

module GoodAnimals
  include Climbable

  class GoodDog < Animal
    include Swimmable
    include Danceable
  end
  
  class GoodCat < Animal; end
end

good_dog = GoodAnimals::GoodDog.new
p good_dog.walk
```

_What is the method lookup path used when invoking `#walk` on `good_dog`?_

The method look up path is `[GoodDog, Danceable, Swimmable, Animal, Walkable]` .
 
---

11

```ruby
class Animal
  def eat
    puts "I eat."
  end
end

class Fish < Animal
  def eat
    puts "I eat plankton."
  end
end

class Dog < Animal
  def eat
     puts "I eat kibble."
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Dog.new]
array_of_animals.each do |animal|
  feed_animal(animal)
end
```

_What is output and why? How does this code demonstrate polymorphism?_

The outputs is `"I eat."`, `"I eat plankton."`, `"I eat kibble."`. As the `array_of_animal` has the objects from each of the class and on each iteration of `each` each obejct is passed into the block and is referenced by `animal` which is begin passed into the `feed_animal` method which invokes `#eat`
 method on current object. As all the class posses an `#eat` instance method it is called and the respectiev string are returned.

As all the three objects are different object types but the client code can call the same method `#eat` on all of them and in the same manner this is polymorphism.

12

```ruby
class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Pet
  def jump
    puts "I'm jumping!"
  end
end

class Cat < Pet; end

class Bulldog < Pet; end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud                     

bob.pets.jump
```

_We raise an error in the code above. Why? What do `kitty` and `bud` represent in relation to our `Person` object?_

The erro is raised as the `bob.pets` we are invoking the `#pets` getter method on the `bob` object which returns an array obejct which is referenced by `@pets` instance variable, and as the `Array` class does not implement a `#jump` instance method the error is raised.

`kitty` and `bud` are collaborators objects to the object `bob` 

---

13

```ruby
class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name
```

_What is output and why?_

The output is `"bark! bark!  bark! bark!"`. This is because on line xx when `::new` is invoked it passes the argument to the `Animal#initialize` method and it does not initailizes the `@name` to the string passed to it the `@name` instance variable is unitialized and so when it is referened in the string and interpolated it returns `nil` on which when `to_s` is called, which is automatically called instring interpolation, empty string is returned.

---

14

```ruby
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

al = Person.new('Alexander')
alex = Person.new('Alexander')
p al == alex # => true
```

_In the code above, we want to compare whether the two objects have the same name. `Line 11` currently returns `false`. How could we return `true` on `line 11`?_

We can return true by implementing the `#==` in our `Person` class and compare the values referenced by `@name` isntance variable of each obejct.

_Further, since `al.name == alex.name` returns `true`, does this mean the `String` objects referenced by `al` and `alex`'s `@name` instance variables are the same object? How could we prove our case?_

No this does not prove that they are the same object. First the `al.name == alex.name` evaluates to `"Alexander" == "Alexander"` and now the `String#==` is invoked whcih comapres if the two values have the same content and length. Second we can invoke `#object_id` on  `al.name` and `alex.name` which will return different address which proves that they are not the same objects.

---

15

```ruby
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "My name is #{name.upcase!}."
  end
end

bob = Person.new('Bob')
puts bob.name
puts bob
puts bob.name
```

_What is output on `lines 14, 15, and 16` and why?_

`Bob`
`My name is BOB.`
`BOB`

As when on line xxx when `puts` invokes the `#to_s` method on `bob` which is overriden in the `Person` class and in it the `#name` getter method is called and the `#upcase!` mutating method is called within the string interpolation. As `upcase!` is a mutating method the string referenced by `@name` si muatated. when on line xxx the `#name` is invoked on `bob` object it retuens the mutated string `'BOB'` which output by `puts`.

---

16

_Why is it generally safer to invoke a setter method (if available) vs. referencing the instance variable directly when trying to set an instance variable within the class? Give an example._

referencing the instance variable directly is noit safer as if there was a data validation which was beign perfomed in the setter method, it will be ignored and we would end up in setting teh wrong value to the instance variable by referencing to it directly.

---

17

_Give an example of when it would make sense to manually write a custom getter method vs. using `attr_reader`._

If we wanted to return a part of the value referenced by the instance variabel, so by tweaking the value in the custom getter method would be make more sense.

---

18

```ruby
class Shape
  @@sides = nil

  def self.sides
    @@sides
  end

  def sides
    @@sides
  end
end

class Triangle < Shape
  def initialize
    @@sides = 3
  end
end

class Quadrilateral < Shape
  def initialize
    @@sides = 4
  end
end
```

_What can executing `Triangle.sides` return? What can executing `Triangle.new.sides` return? What does this demonstrate about class variables?_

`Triangle.sides` sometimes can return `4` and can sometime return `3` and can sometime return `nil`.

The class and all of it subclasses share a single copy of the calss variable and by reassinging it in the subclass will effect it in the superclass.


---

19

_What is the `attr_accessor` method, and why wouldn’t we want to just add `attr_accessor` methods for every instance variable in our class? Give an example._

it is a method which gives us getter and setter method of the name which passed to it as symbol.

As we might not want to give access to change the value of a certain instance variable, or we might only want to change the value referenced by the insatnce variable and not access it outside the class.

---

20

_What is the difference between states and behaviors?_

The state refers to the data that is associated with the insatnce of the class and behaviour is what the object of the class have the ability to do.

he state of an object is tracked by instance variables. If there are two objects instantiated from a class, they are both objects of the same class but may contain different information for the indiviual object, such as name, height, weight. ==So, instance variables are used to track the state of indiviual object and this tells us that instance variables are scoped at the object or instance level==.

The two objects are seprate objects but are instances of the same class and so the they share behaviours that are defined as instance methods in a class. ==Insatance methods defined in class are accessible to the objects of that class==.

---