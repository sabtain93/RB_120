# Practice Test 1

## Classes and Objects

__Q: What is Object Oriented Programming, and why was it created? What are the benefits of OOP, and examples of problems it solves?__

OOP is a programming pattern of programming that deals with the increasing complexity of large software application by creating sections of code that interact with each other rather than depnding depnedent on each other.

Using OOP we benifit from concepts like inheritance which lets us define basic classes which can used in various scenarios and defining subclasses are more detailed useabilty.

OOP helps in breaking down complex problems in a sysmatic manner. By defining classes sepcific to the problem and using real world nouns to name objects helps programmers to think on a higher level of abstraction.

__Q: What is a class? What is an object? What relationship do they have? Explain with an example?__

classes are blueprint for objects, they define behaviours and attributes that its objects will have.

Objects instantiated from classes. objects of a same class contain different information but share the behaviours defined in the class.

```ruby
class Engineer
  def draw
    "I can draw"
  end
end

sabtain = Engineer.new
```

__Q: What is Instantiation? Give an example.__

The process of object creation in called instantiation. by calling the `::new` method on a class we instatiate an object from that class.

```ruby
class Engineer
  def draw
    "I can draw"
  end
end

sabtain = Engineer.new # here we are instantiating the `sabtain` object of the `Engneer` class
```

__Q: When defining a class, we usually focus on state and behaviors. What is the difference between these two concepts?__

State refers to the data associated with an instance of the class and behaviour is what the object has the ability of doing

Object's state is tracked through instance variables. object's instantiated from the same class have unique state which can be tracked through the object's insatnce variable

Behaviours are defined as instance methods in a class and are accsible to all object of that class.


__Q: How do you initialize a new object? Give an example?__

we initalize a new object by calling the `::new` method on the class name.

```ruby
class Engineer
  def draw
    "I can draw"
  end
end

sabtain = Engineer.new # here we are instantiating the `sabtain` object of the `Engneer` class
```

__Q: # What is the relationship between classes and objects in Ruby?__

Objects are created from classes. Classes can be thought of as blueprint for objects. classes define attributes and behaviours that the object of that class will have.

__Q: What is a constructor method?__

The constructor method is what builds an object. It is triggerd by the `::new` method called on the class name whoch triggers the `#initialize` method the constructor. The constructor can be passed arguments through the `::new` method call and are used to initialize the instance variable of an obejct.

__Q: What is the difference between classes and objects?__

__q: What is the default to_s method that comes with Ruby, and how do you override this?__

The default `to_s` returns the string class of the object and its memory location. We can override it by defining it in our custom class.

__Q: What are some important attributes of the to_s method?__

calling `puts` automatically calls `to_s` method on its argument and is automatically called in string interpolation.

__Q: Explain the idea that a class groups behaviors.__

classes group behaviours that are accesible to all objects of that class. classes define behaviours as instance methods. We can instance methods defined in a class expose behaviours for its objects.

__Q: Objects do not share state between other objects, but do share behaviors__

Objects of the same class share behaviours that is they can access the instance methods defiend in the class. But state of an object is unique and is tracked through the object's instance variables. Insatnce variables are scoped at the object level which is that are only accessible in the obejct insatnce methods.

__Q: The values in the objects' instance variables (states) are different, but they can call the same instance methods (behaviors) defined in the class.__

__Q: What is the difference between states and behaviors?__

state is the data associated with the object and behaviour is the ability the object has. Objects of the same class have unique state which is tracke dthrough the object's instance variable. The behaviours defined in a class are accessible to all the object of that class.

__Q: Describe the distinction between modules and classes.__

Modules and classes both group behaviours. But object cannot be insatntiated from modules. We can subclass from only one class but can include as many modules.

__Q: Given the below usage of the Person class, code the class definition__

```ruby
bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
bob.name                  # => 'Robert'
```


__Q: Modify the class definition from above to facilitate the following methods. Note that there is no name= setter method now__
      Hint: let first_name and last_name be "states" and create an instance method called name that uses those states.

```ruby
bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'
```

__Q: Using the class definition from step #3, let's create a few more people -- that is, Person objects__
    If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?

```ruby
bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
```
we have a name instance method which returns the full name contained by the object. So by calling the `name` insatnce method on bob object (which returns a string object) and calling the `String#==` method and pass in the return value of `rob.name` (which also returns a string object) we can find out if both objects contain the same name.

__Q: Continuing with our Person class definition, what does the below print out?__

```ruby
bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
```
here we reference the object `bob` in the string interpolation. The `to_s` method is automatically called in string interpolation. So by default the `to_s` method returns the objects class name and an ecryption of the object_id. so the string `"The perosn's name is: <Person#68767868767>"` is output.

__Q: Let's add a to_s method to the class. Now, what does the below output?__

```ruby
class Person
  # ... rest of class omitted for brevity

  def to_s
    name
  end
end
Now, what does the below output?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
```
We are overridng the inherited `to_s` method which returns the string returned by the `name` instance method of the calling object.

__Q: What happens when you call the p method on an object? And the puts method?__

When `p` is invoked the built in `inspect` method is called on its argument. the `inspect` method returns a string represenation of the object which includes class name of the obejct, object id encoding the insatnce variables and their values associated with that object.

Where as `puts` calls the `to_s` method on its arguments. By default the `to_s` method returns the class name of object and an encoding of the object id.

__Q: What is output on `lines 14, 15, and 16` and why?__

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
line 180 outputs the value of the `@name` instance variable associated with the `bob` object of the `Person` class. Which is the string `Bob`.

Line 181 calls the `Person#to_s` method which returns the string and so line 181 outputs `My name is BOB`.
On line 175 the `name` instance method for the `bob` object is referenced which returns the value referenced by the `bob` object's `@name` instance variable which is then mutated by calling the `String#upcase!` method.

Line 182 outputs `BOB`. This is becasue the string referenced by the `@name` instance variable is mutated on line 175 when the `to_s` method is called on `bob` object on line 181. This is why the `@name` instance variable now points to `'BOB'` and is the output of line 182.

__Q: # What is output and why? How could we output a message of our choice instead?__

```ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky
```
on line 206 the `puts` method is called and the `sparky` object is passed to it as an argument. `puts` automaticlly calls the `to_s` method on its argument. The `to_s` method is not defined for the `sparky` object in its class `GoodDog` and so the inherited `to_s` method is invoked which returns the class nmae of the object and an encoding of the object's id.

We can output a meassage of our own choice by defining a `to_s` method in the `GoodDog` class which overrides the inherited version.

__Q: How is the output above different than the output of the code below, and why?__

```ruby
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
p sparky
```
Here we have invoked `p` and passed in the `sparky` object to it. Invoking `p` automatically calls the `inspect` method on its argument. The `inspect` method by default returns the string represenation of the object which includes the class name, encoding of object id, insatnce variables and their values associated to the object.

__Q: Do `molly` and `max` have the same states and behaviors in the code below? Explain why or why not, and what this demonstrates about objects in Ruby.__

```ruby
class Cat
  def initialize(name, coloring)
    @name = name
    @coloring = coloring
  end

  def purr; end

  def jump; end

  def sleep; end

  def eat; end
end

max = Cat.new("Max", "tabby")
molly = Cat.new("Molly", "gray")
```
`max` and `molly` are objects of the class `Cat`. All objects have unique state which is tracked through the object's insatnce variables. In the code above `max` object's state comprises of `"Max"` and `"tabby"` which can be tracked through the instance variables `@name` and `@coloring`. Object cannot access another object's instance variable, instance variables are scoped at the object level which means that an instance variable is accessible in the object's insatnce method, even if it was it was initialize outside that insatnce method.

Whereas behaviours defined in the class are accessible to the all the objects of that class.

## Creating Setters and Getters

__Q: What is an accessor method?__

accessor methods are insatnce methods that are exposed to return the state of an object. By the aid of accessor methods we can access an object state and change an object's state. Getter methods are used to access state and setter methods are used to change state of an object

__Q: What is a getter method?__

__Q: What is attr_accessor?__

attr_accessor is a method which takes symbols as arguments which it uses to create setter and getter methods of that name.

__Q: Explain how the element getter (reference) and setter methods work, and their corresponding syntactical sugar.__

getter method can be called to access the instance variable. Setter methods ae defined as `somesetter=()` but when we calla setter method and pass it an argument, Ruby provides us a special syntax to do so which is more natural which is `object.somesetter = somevalue`. It looks like assignment but we are actually calling the setter method.


__Q: When using getters and setters, in what scenario might you decide to only use a getter, and why is this important?__

setter are used to change the state of an object so to prevent from data mainpulation without explicit intention it is better not to define a public setter method.

__Q:We expect the code above to output `”Spartacus weighs 45 lbs and is 24 inches tall.”` Why does our `change_info` method not work as expected?__

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
In the `change_info` on line 290 to 292 we would want to call the getter methods `name=`, `height=` and `weight=` but instead we are initializing local variables. This is why we are not getting the expected output. 

setter methods are always called on `self` this tells ruby that a setter method is begin called. SO by prefixing `self.` to line 290 to 292 we can achieve the expected output.

__Q: In the code below, we hope to output `'BOB'` on `line 16`. Instead, we raise an error. Why? How could we adjust this code to output `'BOB'`?__

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
On line 327 we call the `change_name` instance method on the `bob` obejct. within the `change_name` instance method we wanted to call the setter method `name=` and then call `String#upcase` on the return value of the getter method `name`. But instead we initialize the `name` local variable and on same line we are referencing it before it gets initialized. The reference of the `name` local variable shadows the `name` getter method which is why the errorn is raised.

By calling the setter method on `self` we tells ruby that we are calling a setter method. So by prefixing`self.` on line 321 we eliminate this error.


__Q: # What is the `attr_accessor` method, and why wouldn’t we want to just add `attr_accessor` methods for every instance variable in our class? Give an example.__

__Q: When might it make sense to format the data or prevent destructive method calls changing the data by using a custom getter or setter method?__


## Instance variables and Scope

__Q: What is an instance variable, and how is it related to an object?__

instance variables have a `@` symbol in front of them. Instance variables track the state of an object and are scoped at the object level which mean an insatnce variable is accssible in an ibject's instance method.

__Q:Why does this code not have the expected return value?__

```ruby
class Student
  attr_accessor :grade

  def initialize(name, grade=nil)
    @name = name
  end
end

ade = Student.new('Adewale')
ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">
```
Becuase the `@grade` instance variable is not initialized for the `ade` object. When the `ade` object is instantiated `@name` instance variable is initialized to the argument passed to `initialize` through the `::new` method. But the within the constructor the `@grade` instance variable is never initialized nor does the setter method is called for the `@grade` is invoked and passed `nil` as an argument.

__Q: What is the scoping rule for instance variables?__
instance variables are scoped at the istance level, that is an instance variable can be accessed in the object's instance method, even if it was not initialized within that instance method.

__Q: How does sub-classing affect instance variables?__
Instance variables values are not inherited. Instance variables must be initialized by calling the instance method that initializes it only then can be used by the instance.

__Q:# What is the return value, and why?__

```ruby
class Person
  def get_name
    @name                     # the @name instance variable is not initialized anywhere
  end
end

bob = Person.new
bob.get_name                  # => ??

```
`nil` is returned as Ruby return `nil` for unintialized instance variables. On line 378 the `get_name` instance method is called on the object `bob`, on line 373 the `get_name` method references the `@name` insatnce variable which is not initialized.

__Q:What will this return, and why?__

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
line 401 returns the string `'bark! bark!  bark! bark!'` as the `dog_name` is called `teddy` obejct of the `Dog` class. On line 396 we are referencing to the `@name` insatnc variable which is not initialized and `nil` is returned by when uninitialized instance variable is referenced. The instance variable is not initialized as when the object `teddy` is instatiated on line 400 the `Dog#initialize` insatnce method is called and is passed the string `"Teddy"` as an argument which overrides the inherited `Animal#initialize` method. So the `@name` insatnce variable is never initialized.

__Q: How do you get this code to return “swimming”? What does this demonstrate about instance variables?__

```ruby
module Swim
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swim

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
teddy.swim
```                         
We can get this code to return `"swimming"` by calling the `#enable_swimming` on `teddy` object and then calling the `#swim` instance method as on line 423.

This shows that instance variables and there values are not inherited but they need to be initialized by calling the instance in which they are initialized and then they can be accessed by the instance.

__Q:What is output and why? What does this demonstrate about instance variables that differentiates them from local variables?__

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
line 441 outputs `nil`. As we are calling the `#name` getter method on the `bob` object of the `Person` class on line 441. The `#name` insatnce method returns the value referenced by the `@name` instance variable associated to the `bob` object. As the `@name` instance variable is uninitialized so `nil` is returned.

This demonstrates that for uninitialzied instance variable `nil` is returned but if an uninitialized local variable is referenced Ruby raise an error.

__Q: What is output and why? What does this demonstrate about instance variables?__

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


__Q:What does the above code demonstrate about how instance variables are scoped?__

```ruby
class Person
  def initialize(n)
    @name = n
  end
  
  def get_name
    @name
  end
end

bob = Person.new('bob')
joe = Person.new('joe')

puts bob.inspect # => #<Person:0x000055e79be5dea8 @name="bob">
puts joe.inspect # => #<Person:0x000055e79be5de58 @name="joe">

p bob.get_name # => "bob"
```
this demomstartes that instance variables are scoped at the object level, which means that an insatnce variable is accessible in the object's instance method, even if it not initialized within that instance method. 

As here the `@name` instance variable is initialized for `bob` and `joe` object on insatntiation within the initialize instance method. The instance variable is accessible in `Person#get_name` when it is called on `bob` object on line 488.


__Q: How do class inheritance and mixing in modules affect instance variable scope? Give an example.__


__Q:Running the following code will not produce the output shown on the last line. Why not? What would we need to change, and what does this demonstrate about instance variables?__

```ruby
class Student
  attr_accessor :grade

  def initialize(name, grade=nil)
    @name = name
  end 
end

ade = Student.new('Adewale')
p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">
```
This is because when the `ade` object is insatntiated on line 509 from the `Student` class the `@grade` instance is not initialized. So when on line 510 `#inspect` is called on the `ade` the object's string represenation only shows `@name` and its value associated with the `ade` object.

By initializing `@grade = grade` we can produce the desired output. This demonstrate that insatnce variables are to be initialized by calling the insatnce method in which it is initialized and then it can accessed by the instance.

__Q: What are the scopes of each of the different variables in the above code?__

```ruby
class Person
  TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']

  @@total_people = 0

  def initialize(name)
    @name = name
  end

  def age
    @age
  end
end
```
`TITLES` is a constant and consatnts have a lexical scope.
`@@total_people` is a class variable, class variables are scoped at the class level
`@name` and `@age` are instance variables and they are scoped at the object level, this means that they are accessible in the object's instance method.

## Class variables and scope

__Q: What is the purpose of a class variable?__

Class variables are used to tracl class level details and are not concerend with the indiviual objects of the class.

__Q: What are the scoping rules for class variables? What are the two main behaviors of class variables?__

Class varibales are scoped at the class level.

all objects of a class share one copy of the class variable and so can access the class variable by means of instance method

A class method can access a class variable if it is initialized before the class method is called.

__Q: Are class variables accessible to sub-classes?__

Yes, class variables are accessible to sub-classes and all objects share one copy of the class variable.

__Q: Why is it recommended to avoid the use of class variables when working with inheritance?__

As all objects share one copy of the class variable it possible that an object of a subclass reassign the class variable by means of instance method. Now if a superclass's object tries to access the class variable by means of instance method there might be a confusion with the return value of the class variable as it was reassigned by the other object.

__Q:What would the above code return, and why?__

```ruby
class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

Vehicle.wheels                              # => ??

class Motorcycle < Vehicle
  @@wheels = 2
end

Motorcycle.wheels                           # => ??
Vehicle.wheels                              # => ??

class Car < Vehicle
end

Car.wheels                                  # => ??
```
line 570 returns `4`. As the class variable referenced in the `Vehicle::wheels` is initialzed before the class method is called when the class was loaded by Ruby.

line 576 returns `2`. Now the `Motorcycle` class inherits from `vehicle` and so on line 573 `@@wheels` is reassigned to `2` when the `Motorcycle` class is loaded and now when the `Motorcycle::wheels` class method is called Ruby executes the inherited `::wheels` method hwich reference the `@@wheels` class variable which was reassigned on lien 573.

line 577 returns `2`. As its the same copy of `@@wheels` class variable that is shared among all the subclasses and as it was reassigned when teh `Motorcycle` class was loaded this is why the `@@wheels` reference in the `Vehicle::wheels` now returns `2`.

line 582 returns `2`. `Car` class also inherits from `vehicle` and its also share the same copy of `@@wheels` class variable so when `Car::wheels` is called it also returns `2` which is the value now referenced by `@@wheels` class variable.

__Q: What can executing `Triangle.sides` return? What can executing `Triangle.new.sides` return? What does this demonstrate about class variables?__

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
This demonstrates that all objects of a class and objects of its subclasses share a single copy of a class variable. Class variables can be accessed by the objects by means of instance method.


## Constants and scope

__Q: What is a constant variable?__

constants are variables that do not change the value that they reference.

__Q: What are the scoping rules for constant variables?__

consatnt have a lexical scope. Lexical means that where the constant is defined in the code determines where it is available. Ruby resolves the constant by searching lexically, that means the ruby searches the surronding structure of the constant reference.

__Q: Is it possible to reference a constant defined in a different class?__

Yes it is possible, we can do that with the help of constant resolution operator. By adding the class name along with `::` infront of the constant name tells Ruby where to search for the consatnt that is referenced.

__Q: What is the namespace resolution operator?__

__Q: How are constants used in inheritance?__

Ruby resolves consatnt by searching lexically of the constant reference, if it not found then ruby searches for it in the inheritance heirarcy of the class where it is referenced.

__Q: Describe the error and provide two different ways to fix it.__

```ruby
module Maintenance
  def change_tires
    "Changing #{WHEELS} tires."
  end
end

class Vehicle
  WHEELS = 4
end

class Car < Vehicle
  include Maintenance
end

a_car = Car.new
a_car.change_tires      
```
line 660 the `#change_tires` instance method is called on the `a_car` object. Within the `#change_tires` method on line 647 we are refrencing the `WHEELS` constant and it is resolved by searching in the lexical scope of the consatnt reference, which is the `Maintenance` module. It is not found there and so error is raised.

One way is to used constant resolution operator and reference the class of the calling object. According to this change  line 647 will be `"Changing #{self.class::WHEELS} tires"`.

The other way is to define an instance method `#wheels` which references the `WHEELS` consatnt and on line 647 instead of refrencing the consatnt we can reference the instance method.

__Q: What is lexical scope?__

Lexical scope means that where a constant is defined determines where it is accessible in the code. Ruby resolves the consatnt by searching lexically, which means that ruby searches for the consatnt in the surrounding structure of the consatnt reference.

__Q: When dealing with code that has modules and inheritance, where does constant resolution look first?__

Looks first in the surrounding structure of the consatnt reference if doesn;t find it there then it is nlooked for in consatnt look up path. Any module included is looked into first before the superclass.

__Q: What is output and why? What does this demonstrate about constant scope? What does `self` refer to in each of the 3 methods above?__

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
line 703 outputs `4`
The `::sides` class methdo is called on `Square` class. Within the `::sides` class method on line 689 the consatnt `SIDES` is referenced with a consatnt resloution operator with `self` which referes to the class on which the method is called. So Ruby looks for the consatnt in `Square` class then it look up teh constant look up path and find the consatnt in quadrlateral and so `4` si returned.

line 704 outputs `4`
Here the `#sides` instance method is called on the `square` object. Within the `#sides` method on line 693 Ruby resolves the consatnt `SIDES` by looking into the class returned by `self.class` which returns `Square`. RUby looks for the constant in the `Square` class then in the consatnt look up path and find it in the `Quadrilateral` class.

line 705 raises an error
As within the `#describe_shape` method the `SIDES` constant is referenced in the string interpolation. Ruby searches for the consatnt in the surronding structure of the `Describable` module and does find it there and not in the consatnt lookup path.

on line 689 `self` refers the class that calls the method.
online 681 and 693 `self` referes to the calling object.


## Instance methods vs Class methods

__Q: What is an instance method?__

Instance method are methods defined in a class that refer to the behaviors that the objects of that class will posses. Objects of the same class share behavior but may have different states.

__Q: How can we expose information about the state of the object using instance methods?__

We can expose information about the state of an object using instance method as instance methods have access to instance variables. So we can refer to the instance variable within the instance method and instance variables track the state of an object.

__Q: What are class methods?__

Class methods are methods defined on the class and are called directly on the class itself, without instantiating any object.

__Q: Classes also have behaviors not for objects (class methods).__

__Q: What is the difference between instance methods and class methods?__

class methods are defined on the class itself and so are prefixed with `self.`, whereas instance methods are defined in the class and so are defined without prefixing `self.`.
class methods are called directly on the class itself, without instantiating any object. whereas the instance methods are called on the objects of the class.
class methods cannot access insatnce variables, but class variables are accessible within instance methods.


## Method Access Control

__Q: What is Method Access Control?__

Method Access Control is a way to allow or restrict access to the instance methods defined in the class. We can limit access to methods defined in a class with the help of access modifiers, that are public, private and protected.

__Q: What is the private method call used for?__

`private` method call is used to set methods private. private methods cannot be accessed from outside the class but can only be accessed through other methods that are public, and can only be called on the current object.

__Q: What is the protected keyword used for?__

`protected` keyword is used to limit access to instance methods in a class. Proteced insatnce methods cannot be accessed from outside the class but can only be accessed through other methods that are public. But unlike `private` methods protected methods allow access between instances of the class (or subclass).

__Q: What are two rules of protected methods?__

- protected methods are not accessible from outside the class but can only be accessed through other methods that are public.

- protected methods allow access btween instances of the class.

__Q: # How is Method Access Control implemented in Ruby? Provide examples of when we would use public, protected, and private access modifiers.__

Method access control is implemented in ruby with the help of access modifiers that are `public`, `private` and `protected`. 

By default all instance methods are public, which is that they are accessible from outside the class.

`private` and `protected` methods limit access to instance methods and can only be accessed through the public methods.

`private` methods can only be called on the current objects. Whereas, protected methods allow access between object of the class.

```ruby
class Engineer
  def initialize(name, id, dept, salary)
    @name = name
    @id = id
    @dept = dept
    @salary = salary
  end

  def current_department
    dept.clone
  end

  def employee_id
    id.clone
  end

  def >(other)
    salary > other.salary
  end

  private

  attr_reader :id, :dept

  protected

  attr_reader :salary
end

engineer1 = Engineer.new('stan', '2592', 'electrical', '5000')

engineer2 = Engineer.new('mike', '2593', 'civil', '5500')

puts engineer1.current_department # 'electrical'
engineer1.dept # NoMethdo error
puts engineer2.current_department # 'civil'
puts engineer2 > engineer1 # 'true'

```
Here by using the `private` method call the `#id` and `#dept` getter methods are not accessible from outside the class but can be accessed through the public insatnce methods `#employee_id` and `current_dept`. This is so that the state of the object cannot be mainpulated from outside the class.

Here by setting the `#salary` getter method as protected it cannot be accessed from outside the class. But we can call the `#salary` getter method from within the `#>` method and we can see that protected methods allow access between the instances of the class and so we can call the `#salary` on the object referenced by `other` which is passed in as an argument.

## Referencing and setting instance variables vs. using getters and setters

__Q: How do you decide whether to reference an instance variable or a getter method?__

when we only want to expose some part of the value referenced by the instance variable we can reference the getter method and tweak the value in the getter method.

__Q: Why does the `.change_info` method not work as expected here?__

```ruby
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says arf!"
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

sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      
# => Sparky weighs 10 lbs and is 12 inches tall.
```
Within the `#change_info` we are not calling the `name=`, `height=`, or `weight=` but instead we are initializing local variables. So to invoke the setter methods we have to prefix `self.` so ruby can differentaite between a setter method call and local variable initialization.

__Q: What code snippet can replace the "omitted code" comment to produce the indicated result?__

```ruby
class Person
  attr_writer :first_name, :last_name

  def full_name
    # ommited code
  end
end

mike = Person.new
mike.first_name = 'Michael'
mike.last_name = 'Garcia'
mike.full_name # => 'Michael Garcia'
```
`@first_name + " " + @last_name` as by calling the setter methods `#first_name=` and `=last_name` the `@first_name` and `@last_name` instance variables are initialized.  


__Q: The last line in the above code should return "A". Which method(s) can we add to the Student class so the code works as expected?__

```ruby
class Student
  attr_accessor :name, :grade

  def initialize(name)
    @name = name
    @grade = nil
  end
end

priya = Student.new("Priya")
priya.change_grade('A')
priya.grade # => "A"
```
by adding the following code 

```ruby
class STudent
  # rest fo the code
  def change_grade(grade)
    self.grade = grade
  end
end
```

__Q: Why is it generally safer to invoke a setter method (if available) vs. referencing the instance variable directly when trying to set an instance variable within the class? Give an example.__

whenever we want to tweak the value before assinging it to the instance variable we can modify it in the setter method.

__Q: Give an example of when it would make sense to manually write a custom getter method vs. using `attr_reader`__

when we only want to expose some part of the value referenced by the instance variable we can reference the getter method and tweak the value in the getter method.

```ruby
class Person
  attr_reader :name

  def initialize(name, id_no)
    @name = name
    @id_no = id_no
  end

  def id_no
    id_arr = @id_no.split('-')
    "XXX-XXX-#{id_arr}.last"
  end
end

p Person.new('stan', '333-444-555').id_no
#333-444-555
```
Here rather we have tweaked the value referenced by `@id_no` in the the custom getter method as we only wants to expose the last digits of the id_no and not the whole. Now where we want to access the id_no we can reference to the getter method rather tweaking the value of id_no everytime.

## Class Inheritance

__Q: What is inheritance?__

Inheritance is to put common behaviors from classes into one place.

__Q: What is the difference between a superclass and a subclass?__

The class that is inherited from is the superclass and the class that inherits is the subclass. Superclasses are defined as basic classes with a vast resueablity and subclasses are defined with a more detailed behavior.

__Q: When is it good to use inheritance?__

When there is repition and we are defining a behvior in mutiple classes

__Q: In inheritance, when would it be good to override a method?__

When a subclass must define the behavior in a more sepcific manner then method overriding is implemented.

__Q: What is inheritance, and why do we use it?__

Inheritance is when one class inherits from another class. When there are behaviors that are common among classes they are extracted into place.

__Q: Give an example of how to use class inheritance.__

```ruby
class Animal
end

class Dog < Animal
end
```
Here the `Dog` class inherits from the `Animal` class. As dog is-a animal this is heirarcal structure.

__Q: Give an example of overriding. When would you use it?__

```ruby
class Engineer
  def draw
  end
end

class Civil < Engineer
  def draw
    puts "I draw maps"
  end
end

class Electrical < Engineer
  def draw
    puts "I draw electrical circuits"
  end
end

class chemical < Engineer; end

class Enviormental < Engineer; end
```

In the above code the `Engineer` class is a superclass and `Civil`, `Electrical`, `Chemical` and `Enviormental` subclass from `Engineer`. The `#draw` is defined in the `Engineer` class but the `Civil` class and `Electrical` overrides as they have to define the behavior sepcif to the classes.

__Q: Give an example of using the super method. When would we use it?__

`super` is invoked when we want to call the method of the name in which it is invoked earlier in the method lookup chain.

```ruby
class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name, breed)
    super(name)
    @breed = breed
  end
end

```
Here we have the class `Dog` which subclasses from the `Animal` class. In the `Dog#initialize` method we invoked `super(name)` which passes the `name` argument to `Animal#initialize` and initializes the `@name` insatnce variable to it.

__Q: Give an example of using the super method with an argument.__

__Q: Why is it generally a bad idea to override methods from the Object class, and which method is commonly overridden?__

The `#to_s` is commonly overriden.

__Q: What will the following code output?__

```ruby
class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

daisy = Cow.new("Daisy")
daisy.speak
```
`'Daisy says mooooooooooo!'`
__Q: What change(s) do you need to make to the above code in order to get the expected output?__

```ruby
class Character
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} is speaking."
  end
end

class Knight < Character
  def name
    "Sir " + super
  end
end

sir_gallant = Knight.new("Gallant")
sir_gallant.name # => "Sir Gallant"
sir_gallant.speak # => "Sir Gallant is speaking."
```
by referencing the `Knight#name` in place of `@name` the expected output can be achieved.

__Q:Make the changes necessary in order for this code to return the expected values.__

```ruby
class FarmAnimal
  def speak
    "#{self.class} says "
  end
end

class Sheep < FarmAnimal
  def speak
    super + "baa!"
  end
end

class Lamb < Sheep
  def speak
    super + "baaaaaaa!"
  end
end

class Cow < FarmAnimal
  def speak
    super + "mooooooo!"
  end
end

Sheep.new.speak # => "Sheep says baa!"
Lamb.new.speak # => "Lamb says baa!baaaaaaa!"
Cow.new.speak # => "Cow says mooooooo!"
```

__Q: Using the following code, allow Truck to accept a second argument upon instantiation. Name the parameter bed_type and implement the modification so that Car continues to only accept one argument.__

```ruby
class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  def initialize(year, bed_type)
    super(year)
    @bed_type = bed_type
end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type
```
__Q: Given the following code, modify #start_engine in Truck by appending 'Drive fast, please!' to the return value of #start_engine in Vehicle. The 'fast' in 'Drive fast, please!' should be the value of speed.__

```ruby
class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    super() + “Go #{speed} please!”
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')
# Expected output:

# Ready to go! Drive fast, please!
```
__Q: When do you use empty parentheses with super?__

When we want to call call the method of the same name in which super is invoked earlier in the method look up path and do not pass any arguments to it.


__Q: What is namespacing, and how do you instantiate a class contained in a module?__

Namespacing is used when we house similar classes in a module so that similar named classes do not collide with each other. By putting the module name and namspace operatror in fornt of the class name we can instantiate from the class.


__Q: What is output and why? What does this demonstrate about `super`?__

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
output is a string represntation of the obejct `bruno` of the `GoodDog` class.

On line 1171 `super` is invoked which calls the `Animal#initialize` and passes it the argument passed to it `GoodDog#initialize`. This is why the `@name` and `@color` both reference to the same string object `brown`.

This demonstartes that when `super` is invoked without paranthese or sepcific arguments within the paranthese it forwards all the arguments, that are passed to method in which it is invoked, to the method of the same earlier in the method lookup chain.

## Interface Inheritance and Modules

__Q: What is a module?__

module is a collection of shared behaviors. Methods defined in a module can be used in other classes by mixing in the module. A mixin module is included in classes by invoking the `include` method followed by the module name.

__Q: What is a mixin?__

Methdos group behaviors that are common among classes. Methods defined in a module can be used in other classes by mixing in the module. A mixin module is included in classes by invoking the `include` method followed by the module name. 


__Q: When creating a hierarchical structure, under what circumstance would a module be useful?__

If there is not a direct hierarcy and there is a 'has-a' relationship then grouping those behaviours in a module is useful.

__Q: What is interface inheritance, and under what circumstance would it be useful in comparison to class inheritance?__

interface inheritance is the mixing in of modules. Here one type does not inherit form another type, but inherits the interface of the mixin module.

If there is not a direct hierarical structure and there is a 'has-a' relationship it is useful to use interface inheritance.

__Q: What is namespacing?__

Namespacing is defining related classes within a module. This helps in recognizing related classes and it aviods the collision of classes of the same name defined in our code base.

__Q: How does Ruby provide the functionality of multiple inheritance?__

Ruby provides the functionality of multiple inhertitance through mixin modules. As a class can subclass from only one class but can inlcude as modules.

__Q: When should we use class inheritance vs. interface inheritance?__

When there are similar behaviours defined in multiple classes but there is no direct hierarical sturcture. If there is a 'has-a' relationship interface inheritance is used.

Class inheritance is used when there is a direct heirarical realtion. If there is a 'is-a' relation then class inheritance is the choice to be made.

__Q: Describe the use of modules as containers.__
 If there are methods that seem out of place in our code base then those methods can be conatined in a module. These methods are defined as module methods and we prefix `self.` when defining them. Module methods are called directly on the module

`SomeModule::some_out_of_place_method` or `SomeModule.some_out_of_place_method`.

__Q: What is returned/output in the code? Why did it make more sense to use a module as a mixin vs. defining a parent class and using class inheritance?__

```ruby
module Walkable
  def walk
    "#{name} #{gait} forward"
  end
end

class Person
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

mike = Person.new("Mike")
p mike.walk

kitty = Cat.new("Kitty")
p kitty.walk
```
line 1267 ouputs `'Mike strolls forward'` and line 1270 outputs `"Kitty saunters forward"`. 
It is better here to use module as there is no clear heirarical relationship between `Person` and `Cat` class and there is a `has-a` relationship, as a person has the ability to walk and a cat has a ability to walk.d

__Q: What is output and why? What does this demonstrate about how methods need to be defined in modules, and why?__

```ruby
module Drivable
  def self.drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive
```
line 1288 raises an error that there is no `drive` method defined for `bobs_car` object.
As the `Drivable::drive` method is a module method and can only be called directly on the module.

This demostartes that methods in mixin modules must defines without prefixing `self.` so they are accessible to the insatnces of the class in which the module is included in.

__Q: # What module/method could we add to the above code snippet to output the desired output on the last 2 lines, and why?__

```ruby
class House
  attr_reader :price

  def initialize(price)
    @price = price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2 # => Home 1 is cheaper
puts "Home 2 is more expensive" if home2 > home1 # => Home 2 is more expensive
```
We can define the `#<` and `#>` method in the `House` class which will compare the value referenced by the `@price` instance variables of the objects of `House` class.

## Encapsulation

__Q: What is encapsulation?__

Encapsulation is hiding of data and functionality so it is not available to the rest of the codebase. This provides data protection and that data cannot be mainpulated without explicit intention. Through encapsulation we set clear boundries which lets the programmers work on a higher level of abstraction.

__Q: How does encapsulation relate to the public interface of a class?__

In Ruby we achieve encapsulation by creating objects that encapsulate their state and behaviour and only expose the properties and behaviours that user of the object requires. Using method access control it is possible to expose methods(behaviours) through the public interface of the class which is the class's public methods.

Through encapsulation we protect data so that it cannot be mainpulated without expilicit intention. It aids us in defining boundries within our program and introduce new layer of abstarction in the way that the public interface of the class is seprated from the implementation details.

The point of encapsulation is that we get the desired output by interacting with the public interface of the class and abstarcting away the implementation.

__Q: How do objects encapsulate state?__

Objects encapsulate state by hiding their internal represention from rest of the code base. Object of the same class cannot access each other's internal represenation. An object's state is tracked through its instance variables and they are unavailable to rest of the code base. Unless we define instance methods that allow access to instance variables of the object from outside of the class.

__Q: Why should a class have as few public methods as possible?__

As this prevents from exposing behaviours that are not required by the users of the class.

__Q: # What is encapsulation, and why is it important in Ruby? Give an example.__

Ecapsultion is the hiding away data and functionality from rest of the code base. It is imporant as it helps in data unintentional data manipulation. Through encapsulation we set clear boundries within our code and abstract away the implementation details from the public interface of the class.

## Polymorphism

__Q: What is polymorphism?__

It is the ability of different types of data to respond to a common interface. When two or more object types have a method of the same name and we can call it with any of those objects and we are not concerned what type of object calls the method, this is polymorphism.

__Q: Explain two different ways to implement polymorphism.__

One is polymorphism through inheritance. It is when there is a hierarical structure and the interface of the class hierarchy aids in working with the object types in the same way even though the implementation details may vary drastically.

second is polymorphism through duck typing. This when objects of unrelated types repsond to the same method call. Here we are concerened if an object has a certain behaviour and not concerened with the object type. As long as the objects respond to the same method call and take the same number of arguments, we can categorize the objects to a specific type.

__Q: How does polymorphism work in relation to the public interface?__

__Q: What is duck typing? How does it relate to polymorphism - what problem does it solve?__

This when objects of unrelated types repsond to the same method call. Here we are concerened if an object has a certain behaviour and not concerened with the object type. As long as the objects respond to the same method call and take the same number of arguments, we can categorize the objects to a specific type.
It helkps in maintaing the code.

__Q: The above code would work, but it is problematic. What is wrong with this code, and how can you fix it?__

```ruby
class Wedding
  attr_reader :guests, :flowers, :songs

  def prepare(preparers)
    preparers.each do |preparer|
      case preparer
      when Chef
        preparer.prepare_food(guests)
      when Decorator
        preparer.decorate_place(flowers)
      when Musician
        preparer.prepare_performance(songs)
      end
    end
  end
end

class Chef
  def prepare_food(guests)
    # implementation
  end
end

class Decorator
  def decorate_place(flowers)
    # implementation
  end
end

class Musician
  def prepare_performance(songs)
    #implementation
  end
end
```
If in the future we are required to add another preparer type, this would be problematic and we would have to change the implementation of the `Wedding#preparer` method.

We can fix this code by definig a preparer method in all the preparer classes which takes one argument. In the `Wedding#prepare` method we will call the `#preparer` method and pass in `self` as the argument which referes to the weeding object, so the relevenat attributes of weeding object are available in the preparer type. Now we rather checking the object type in `#prepare` instance method we can simply call the method `#preparer` without concernig what the object type is. 

__Q: What is output and why? How does this code demonstrate polymorphism?__

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
the output will be the strings in this order

`I eat.`
`I eat plankton.`
`I eat kibble.`

This code demostrates polymorphism as the objects in `array_of_animal` all respond to the `#eat` method call on line 1422. As all the classes in the above code posses the `#eat` method and the `Fish#eat` and `Dog#eat` override the inherited `Animal#eat`. Here the  interface of the class hierarchy aids in working with all of the object types in the same way even though the implementation details are different. this is polymorphism.

## Method Lookup Path

__Q: What is the method lookup path?__

The order in which Ruby inspects the classes when a method is called is the method look up path.

__Q: How is the method lookup path affected by module mixins and class inheritance?__

with module mixins, Ruby searches for the method first in the class of the calling object. The it looks in the last mixed in module. So the module mixed in last inlooked into first.

After the modules are looked into then Ruby looks into the superclass from which the calling the object class directly inherits from.

__Q:What is the method lookup path used when invoking `#walk` on `good_dog`?__

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
The method lookup path for the `#walk` method call on `good_dog` object is `[GoodDog, Danceable, Swimmable, Animal, Walkable]`. Ruby does not go further than `Walkable` module as it finds tyhe `#walk` insatance method in it.

__Q: What is the method lookup path that Ruby will use as a result of the call to the `fly` method? Explain how we can verify this.__

```ruby
module Flight
  def fly; end
end

module Aquatic
  def swim; end
end

module Migratory
  def migrate; end
end

class Animal
end

class Bird < Animal
end

class Penguin < Bird
  include Aquatic
  include Migratory
end

pingu = Penguin.new
pingu.fly
```
The method lookup path is `Penguin, Migratory, Aquatic, Bird, Animal, Object, Kernel, BasicObject`. Line xxx raises an error as Ruby does not find the `#fly` in the method look up path.d

We can verify this by calling the `::ancestors` on `Penguin` class.


## `self` and calling methods with `self`

__Q: When would you call a method with `self`?__

We need to call setter methods with an explicit `self` as by not doing so Ruby interprets the call to the setter method as a local variable initialization. So to distinguish the setter method call from local variable initializtion we call setter methods with self. `self` within an instance method referes to the calling object.

All instance methods are called implicity on `self`. But if `self` is not needed it is better to avoid calling on `self` as an explicit calller. 

__Q: From within a class, when an instance method uses self, what does it reference?__

`self` within an instance method refernces the calling object.

__Q: What happens when you use self inside a class but outside of an instance method?__

`self` inside a class but outside of an instance method refers to the class itself.

__Q: Why do you need to use self when calling private setter methods?__

When calling setter methods, wether private or public, calling on `self` explicity is required so Ruby does not interpret it as a local variable initialization.

__Q: Why use self, and how does self change depending on the scope it is used in?__

We use `self` to be explicit about our intention within the code. `self` within a class and inside of an insatnce variable referes to the calling object. `self` within a class but outside the instance method refers to the class itself.

__Q: On which lines in the following code does self refer to the instance of the MeMyselfAndI class referenced by i rather than the class itself? Select all that apply.__

```ruby
class MeMyselfAndI
  self

  def self.me
    self
  end

  def myself
    self
  end
end

i = MeMyselfAndI.new
```

On line x `self` references the `i` object because it is inside an instance method.

__Q:# In the `make_one_year_older` method we have used `self`. What is another way we could write this method so we don't have to use the `self` prefix? Which use case would be preferred according to best practices in Ruby, and why?__

```ruby
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end
```
Another way to write this method is to reassign the `@age` insatnce variable directly, but this is not preferred. If a setter method is available then we should use the setter method as by not doing so there might be data validation within the setter method that we might bypass and this would result in assigning incorrect value to the instance variable.

__Q: What are the use cases for `self` in Ruby, and how does `self` change based on the scope it is used in? Provide examples.__

`self` is used to call setter method within the class inside an instance method. Here it references the calling object. This is required because we need to distinguish between initialization of local variables and calling setter methods. Because if `self` is not used as the explicit caller then Ruby interprets `setter_method = value` as the initialization of a local variable `setter_method`. 

```ruby
class Computer
  attr_accessors :ram

  def initialize(type, ram)
    @ram = ram
  end

  def upragde_ram(new_ram)
    self.ram = new_ram
  end
end

dell = Computer.new("4 GB")
dell.ram # => 4 GB
dell.upgrade_ram("8 GB")
dell.ram # => 8 GB
```
In the `upgrade_ram` method we are calling the setter method `ram=` with an explicit `self`. `self` here references the `dell` object. 

`self` is also used to define class methods. Here it references the class itself in which it is being used.

```ruby
class Computer
  @@number_of_computers = 0

  attr_accessors :ram

  def self.number_of_computers
    @@number_of_computers
  end

  def initialize(type, ram)
    @ram = ram
    @@number_of_computers += 1
  end

  def upragde_ram(new_ram)
    self.ram = new_ram
  end
end

dell = Computer.new("4 GB")

Computer.number_of_computers #=> 1
```

On line xx-xx we are defining a class method `number_of_computer`. We have defined the method name with `self` to make clear that this method is defined on the class `Computer`.

## Fake Operators and Equality

__Q: How does equivalence work in Ruby?__

There are multiple method defined in Ruby classes that could be used to check for equivalence in Ruby. But the most used method is the `==` method. It is defined in the `BasicObject` class which is the superclass for all classes in Ruby. This method is inheritd by all classes. However, most classes override this method by defining this method with their own implementation to provide a more meaningful behaviour in the context of that class. `BasicObject#==` method checks if the two object being compared are the same opject. But subclasses override this behaviour. For example, `String#==` method compares the content and length of the string object. Likewise, `Integer#==` method compares the values of the integer objects.

__Q: How do you determine if two variables actually point to the same object?__

We can use the `equal?` method. Or we can also compare their object ids using the `object_id` method.

__Q: What is == in Ruby? How does == know what value to use for comparison?__

`==` is a method defined inthe `BasicObject` class which checks if two objects are the same object. But as all classes subcalss from `basicObject` they have access to `#==` method and most classes oiverride the implemenation for a more detailed comparison. The `Integer#==` compares the values of the integer object.

The class in which `#==` is implemented defines what value the `#==` compares.


__Q: Is it possible to compare two objects of different classes?__

Yes it is possible to compare two object of different classes. 

__Q:What will the code above return and why?__

```ruby
arr1 = [1, 2, 3]
arr2 = [1, 2, 3]
arr1.object_id == arr2.object_id      # => false
# arr1 and arr2 are different objects that occupy different spaces in memory hence they have different object ids.

sym1 = :something
sym2 = :something
sym1.object_id == sym2.object_id      # => true
# In Ruby if two symbol objects have the same value, then they are the same object. As symbol objects are immutable, this is a performance optimization in Ruby.

int1 = 5
int2 = 5
int1.object_id == int2.object_id      # => true
# In the same way, if two integer objects have the same value then they are the same object.

```
__Q: What is the `===` method?__

`===` is an instance method. This method is defined in the `Object` class which is the super class for all classes in Ruby's Core library. Hence, this method is inherited by all classes.
By default `Object#===` istance method returns the same as the `BasicObject#==` method, that is it returns `true` if the two object being compared are the same object. However, if a class overrides the `BasicObject#==` method with its own implementation, then `Object#===` is also overridden and will now return according to the new implementation of `==` defined in the class.

However, as this method is used implicitly by the `case` statement to determine equivalency of objects, it is overridden by most classes to provide more meaningful behaviour in the context of that class in a `case` statement. For example `Range#===` method determines if the object passed as argument lies in the provides `Range` object e.g. `(1..10) === 5` will return `true`.

__Q: What is the eql? method?__

The `eql?` method determines if the two objects contain the same value and if they are of the same class. Its used by the `Hash` class to determine equality of it key-value pairs. 

__Q: If we use `==` to compare the individual `Cat` objects in the code above, will the return value be `true`? Why or why not? What does this demonstrate about classes and objects in Ruby, as well as the `==` method?__

```ruby
class Cat
end

whiskers = Cat.new
ginger = Cat.new
paws = Cat.new
```
Comparing two `Cat` object using the `==` method would not return `true`. The reason for this is that by default the `==` method returns `true` only if the two objects being compared are the same object otherwise it returns `false`. The reason for this is that `==` method is defined in the `BasicObject` class which is the superclass for all classes in Ruby so the `==` method is inherited by all classes. And the `BasicObject#=` method by default only returns `true ` if the two objects are the same object. To provide more meaningful behaviour in the case of specific classes, we need to override this method by defining `==` method in our class.


__Q:How can you make this code function? How is this possible?__

```ruby
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def >(other_person)
    age > other_person.age
  end
End

bob = Person.new("Bob", 49)
kim = Person.new("Kim", 33)
puts "bob is older than kim" if bob > kim
```
Line x will raise a `NoMethodError` because the `>` method is not defined in the `Person` class. We can fix this by defining a `Person#>` method that compares the `@age` of two `Person` objects.This is possible because `>` is a fake operator in RUby. It is actually an instance method that can be defined in our custom classes and Ruby provides a more natural syntaz for this method. 


__Q: What happens here, and why?__

```ruby
my_hash = {a: 1, b: 2, c: 3}
my_hash << {d: 4}  

```

Last line raises a `NoMethodError` because `Hash` class does not define a `<<` method for its objects.

__Q: When do shift methods make the most sense?__

THe `<<` shift method make most sense when used in classes that represent collections e.g. `Teams`, `Memebers`

__Q: what is dream_team? What does the Team#+ method currently return? What is the problem with this? How could you fix this problem?__

```ruby
class Team
  attr_accessor :name, :members

  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push person
  end

  def +(other_team)
    temp = Team.new("Temp Team")
    temp.members = self.members + other_team.members
    temp
  end
end
# we'll use the same Person class from earlier

cowboys = Team.new("Dallas Cowboys")
cowboys << Person.new("Troy Aikman", 48)

niners = Team.new("San Francisco 49ers")
niners << Person.new("Joe Montana", 59)
dream_team = cowboys + niners         
```

`dream_team` references an array object containing `Person` objects. These `Person` objects are the same objects that are conatined in the `@members` arrays for `cowboys` and `niners` objects.
As per convention followed in the Ruby core library, the `+` method always returns a new object of the calling object's class after concatenating or incrementing. In this case, we are concatenating the array objects referenced by the instance variable `@members` but we are not returning a new `Team` object. We expect the `Team#+` method to return a new `Team` object instead it returns a new array object. 




__Q: What is output? Is this what we would expect when using `AnimalClass#+`? If not, how could we adjust the implementation of `AnimalClass#+` to be more in line with what we'd expect the method to return?__

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
    temp = AnimalClass.new("Temp")
    temp.animals=(animals + other_class.animals)
    temp
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
Line x outputs an array of `Animal` objects which means that `mammals + birds` on line x returned an array of `Animal` objects and that is what `some_animal_classes` references. However, this is not what we would expect the `AnimalClass#+` method to return. As per convention followed in the Ruby's standard library, `+` method usually returns a new object of the calling object's class aftern concatenating or incrementing the value. Currently, `Animal#+` method is concantenating the `@animals` arrays for `mammals` and `birds` objects but it not returning a new `AnimalClass` object. We can fix this shown below. By creating a new `AnimalClass` object and setting its `@animals` instance variable to the new array object returned by concatenating the `@animals` arrays for the two `AnimalClass` objects. And then returning this new `AnimalClass` object. 

__Q: In the code above, we want to compare whether the two objects have the same name. `Line 11` currently returns `false`. How could we return `true` on `line 11`? Further, since `al.name == alex.name` returns `true`, does this mean the `String` objects referenced by `al` and `alex`'s `@name` instance variables are the same object? How could we prove our case?__

```ruby
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def ==(other)
    name == other.name
  end
end

al = Person.new('Alexander')
alex = Person.new('Alexander')
p al == alex # => true
```

Line X is currently returning `false` because `==` method being invoked on this line on the `Person` object referenced by `al` is actually inherited by `Person` class from the `BasicObject` class. `BasicObject#==` method actually returns `true` if the two objects being compared are the same object. As `al` and `alex` reference two differnt `Person` objects, hence line x returns `false`. 

If we want to compare the names of the two objects when we use `==` method to compare two `Person` objects, then we need to override the `BasicObject#==` method in our `Person` class.
`Person#==` should compare the names of the two objects i.e the string objects referenced by the `@name` instance variable for the two objects.

In the expression `al.name == alex.name` we are actually invoking the `String#==` method. This method return `true` if the two string objects have the same value i.e. they have the same content and length. However, that does not mean they are the same objects. We can prove this using the `equal?` method that returns `true` if the two object being compared are the same object.

`al.name.equal?(alex.name)`

__Q: How and why would we implement a fake operator in a custom class? Give an example.__

Fake operators are actually instance methods that Ruby provides with a special syntax that reads more naturally. For example, `+`, `-`, `<<`, `<`, `>` are all instance methods disguised as operators.

Since these all are actually instance methods, we can implement them in our custom classes by defining these methods in our class. The reason for implementing these methods is that it provides our classes with a public interface that reads more naturally and makes it easy to use the classes and its methods. But we should take care to follow the Ruby core library's convention in implementing how these methods work. For example, `+` method usually increments or concatenates two objects and returns a new object of the same class. `<<` is used by `Array` objects to append elements to the array objects and returns the calling array.

For example we can implement the `<<` method in a `ProjectTeam` class as shown below:

```ruby
class ProjectTeam
  attr_accessor :members

  def initialize
    self.members = []
  end

end

class Engineer
end

class ProjectManager
end

team1 = ProjectTeam.new

civil_engineer = Engineer.new
project_manager = ProjectManager.new

team1 << civil_engineer << project_manager

p team1
```

__Q: What methods does this `case` statement use to determine which `when` clause is executed?__

```ruby
number = 42

case number
when 1          then 'first'
when 10, 20, 30 then 'second'
when 40..49     then 'third'
end
```

It used the instance method `Integer#===` in the first and second `when` clauses and `Range#===` in the last `when` clause to determine equivalency of `number` with the objectin the `when` clause. 

__Q: Why does the last line output `false` in the below code?__

```ruby
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def ==(other)
    name == other.name
  end
end

bob = Person.new("bob")

bob2 = Person.new("bob")

bob == bob2                # => false
```
On line x we are invoking the `==` method on object referenced by `bob` and passing in `bob2` as an argument. The `==` method is inherited by the `Person` class from the `BasicObject` class which is the superclass for all classes in Ruby. `BasicObject#==` method returns `true` if the two objects being compared are the same object. `bob` and `bob2` reference two different `Person` objects which is why line x returns false. 

To provide a more meaningful behavior for the `==` method in the context of `Person` objects, we need to override this method in the `Person` class by defining this method in `Person` and specifying what attributes of the `Person` objects to compare to determine equivalence of its objects. 


##  Collaborator Objects

__Q: What is a collaborator object, and what is the purpose of using collaborator objects in OOP?__

A collaborator object is an object that is stored as state within another object. As state is tracked by instance variables, this means that objects that are assigned to instance variables of an other object are known as collaborator objects. 

Collaboration is a way of modeling relationships between object types that have an associative relationship. That is, objects that work togather with each other. Collaborator objects can be thought of as having a 'has a' relationship. For example, a library has books, a team has members, a deck has cards etc.

Collaborator objects are an important aspect of OO design as they represent the connections between the various buidling blocks of the program. Collaborator objects allow us to breakdown the problem into smaller pieces and work on the smaller pieces seperately. This makes solving the smaller problem easier. And then bringing togather all the pieces or buidling blocks that fit togather to solve the problem at hand.

__Q:Identify all custom defined objects that act as collaborator objects within the code__

```ruby
class Person
  def initialize(name)
    @name = name
  end
end

class Cat
  def initialize(name, owner)
    @name = name
    @owner = owner
  end
end

sara = Person.new("Sara")
fluffy = Cat.new("Fluffy", sara)
```

In this problem, the `Person` object referenced by `sara` is acting as a collaborator object for the `Cat` object referenced by `fluffy` because it is assigned to the instance variable `@owner`. So `Person` objects are collaborators for `Cat` objects.

__Q: We raise an error in the code above. Why? What do `kitty` and `bud` represent in relation to our `Person` object?__

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

Line X raises a `NoMethodError` because arrays dont have a `jump` method. On line x `bob.pets` returns the array referenced by the `@pets` instance variable and then we are invoking the `jump` method on that array. This is why the error is raised.

`kitty` and `bud` are collaborator objects for the `Person` object referenced by `bob` because they are stored as part of the state of `Person` object.

__Q: What are collaborator objects, and what is the purpose of using them in OOP? Give an example of how we would work with one.__

A collaborator object is an object that is stored as state within another object. As state is tracked by instance variables, this means that objects that are assigned to instance variables of an other object are known as collaborator objects. 

Collaboration is a way of modeling relationships between object types that have an associative relationship. That is, objects that work togather with each other. Collaborator objects can be thought of as having a 'has a' relationship. For example, a library has books, a team has members, a deck has cards etc.

Collaborator objects are an important aspect of OO design as they represent the connections between the various buidling blocks of the program. Collaborator objects allow us to breakdown the problem into smaller pieces and work on the smaller pieces seperately. This makes solving the smaller problem easier. And then bringing togather all the pieces or buidling blocks that fit togather to solve the problem at hand.

```ruby
class ProjectTeam
  attr_accessor :members

  def initialize
    @members = []
  end

end

class Engineer
end

class ProjectManager
end

class AdminStaff
end

team1 = ProjectTeam.new
bob = Engineer.new
jim = ProjectManager.new
sara = AdminStaff.new

team1.members.push(bob, jim, sara)

p team1

```
## Spike

__Q: What is a spike?__

__Q: When writing a program, what is a sign that you’re missing a class?__

__Q: What are some rules/guidelines when writing programs in OOP?__

__Q: # The following is a short description of an application that lets a customer place an order for a meal:__

# - A meal always has three meal items: a burger, a side, and drink.
# - For each meal item, the customer must choose an option.
# - The application must compute the total cost of the order.

# 1. Identify the nouns and verbs we need in order to model our classes and methods.
# 2. Create an outline in code (a spike) of the structure of this application.
# 3. Place methods in the appropriate classes to correspond with various verbs.


