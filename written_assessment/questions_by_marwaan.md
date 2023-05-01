#1 — What will the following code output? Why?

```ruby
class Student
  attr_reader :id

  def initialize(name)
    @name = name
    @id
  end

  def id=(value)
    self.id = value
  end
end

tom = Student.new("Tom")
tom.id = 45
```
line 18 raises an error. This is because on line 18 the `#id=` method is called with `45` as an argument. The `#id=` is defined on line 12 and within the instance method we are calling the `self.id =` which is same as `#id=` this causes the `#id=` method beign called recursively which results in error begin raised.


#2 — Define a class of your choice with the following:

Constructor method that initializes 2 instance variables.

Instance method that outputs an interpolated string of those variables.

Getter methods for both (you can use the shorthand notation if you want).

Prevent instances from accessing these methods outside of the class.

Finally, explain what concept(s) you’ve just demonstrated with your code.

```ruby
class Engineer
  def initialize(name, type)
    @name = name
    @salary = salary
  end

  def info
    puts "I am #{name} and I earn #{salary}"
  end

  private

  attr_reader :name, :salary
end

```
firstly that the object's of `Engineer` class have the attributes `name` and `salary`. We have restricted the user of the class to directly access these attributes by setting the getter methods for `@salary` and `@name` as private.

Second we have defined the `#info` method as public so it comprises the public interface of the class, through which the user of the object can access the `name` and `salary` as the `#info` method returns the value referenced by `@value` and `salary` of the calling object interpolated in a string. This is how the data associated with the object's of `Engineer` class is protected and cannot be manipulated by the users of the object.

#3 — What concept does the following code aim to demonstrate?

```ruby
module Greet
  def greet(message)
    puts message
  end
end

class Teacher
  include Greet
end

class Student
  include Greet
end

tom = Teacher.new
rob = Student.new

tom.greet "Bonjour!"
rob.greet "Hello!"
```
This example demonstrates polymorphism through interface inheritance. As both the objects `tom` and `rob` that belong to different classes are able to invoke the method `#greet` in the same manner. This is so, as both the classes `Teacher` and `Student` inlcude the `Greet` module which provides both the classes with the `#greet` instance mehtod.

#4 — What will the last line of code return?

```ruby
class Student
  def initialize(id, name)
    @id = id
    @name = name
  end
  
  def ==(other)
    self.id == other.id
  end

  private
  
  attr_reader :id, :name
end

rob = Student.new(123, "Rob")
tom = Student.new(456, "Tom")

rob == tom
```
line xxx will raise an error. As within the `Student#==` method we are calling the the `#id` getter on the istance other than the current object and as the `#id` getter method is set to `private` this raises an error. As `private` method cannot be invoked on objects other than the current object.

#5 — What will the last 2 lines of code output?

```ruby

class Foo
  def self.method_a
    "Justice" + all
  end

  def self.method_b(other)
    "Justice" + other.exclamate
  end

  private

  def self.all
    " for all"
  end

  def self.exclamate
    all + "!!!"
  end
end

foo = Foo.new
puts Foo.method_a
puts Foo.method_b(Foo)
```
line 131 outputs the string `"Justice for all"`
line 132 outputs the string `"Justice for all!!!"`


#6 — Will the following code execute? What will be the output?

```ruby 
class Person 
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
     "Hello! they call me #{name}"
  end
end

class Puppet < Person
  def initialize(name)
    super
  end

  def greet(message)
    puts super + message
  end
end

puppet = Puppet.new("Cookie Monster")
puppet.greet(" and I love cookies!")
```
No this code will not run and line 164 raises an error. As the `super` method call within the `Puppet#greet` calls the `Person#greet`. As calling `super` without paranthese forwards all the arguments passed into the `Pupper#greet` to `Person#greet` which does not expect any arguments so this raises the error.


#7 — What concept does this code demonstrate? What will be the output?

```ruby
class Bird
  def fly
    p "#{self.class} is flying!"
  end
end

class Pigeon < Bird; end
class Duck < Bird; end

birds = [Bird.new, Pigeon.new, Duck.new].each(&:fly)
```
This demonstartes polymorphism through inheritance. 

As the on line 181 all objects in array are different objects and the client code can invoke the `#fly` method on each object in the same manner, which is it can treat all the objects as a genric bird. The `Pigeon` and `Duck` class do not have a `#fly` instance method of their own and both the object types inherit the `Bird#fly` insatnce method.

#8 — What does the self keyword refer to in the good method?

```ruby
class Dog
  attr_accessor :name

  def good
    self.name + " is a good dog"
  end
end

bandit = Dog.new
bandit.name = "Bandit"
p bandit.good
```
`self` references to the calling object.


#9 — What will the last three lines of code print to the console? After song.artist is called, what would be returned if we inspect the song object?

```ruby

class Song
  attr_reader :title, :artist

  def initialize(title)
    @title = title
    @artist
  end

  def artist=(name)
    @artist = name.upcase
  end
end

p song = Song.new("Superstition")
p song.artist = "Stevie Wonder"
p song.artist
```

line 222 will print the string represenation of the object which includes the class name, encoding of object id and the instance variables and their values associated with the object.

line xxx will print the string `"Stevie Wonder"`

line xxx will print `"STEVIE WONDER"`

we will inspect that the object `song` has the instance variables `@title` and `@song` initialized.


#10 — What will the last 2 lines output in this case?

```ruby
class Song
  attr_reader :title, :artist

  def initialize(title)
    @title = title
  end

  def artist=(name)
    @artist = name
    name.upcase!
  end
end

song = Song.new("Superstition")
p song.artist = "Stevie Wonder"
p song.artist
```
line xxx will print `"STEVIE WONDER"`

As setter method return the argument passed to them on invocation, as the `name` local variables within the `#artist=` references the same string that is is passed in on invocation, so when the `upcase!` is called on it the string referenced by `name` is mutated and so is returned on line xxx. As `@artist` points to the same string as `name` when on line xxx the getter method is called on `song` object `"STEVIE WONDER"` is printed out.

 What would cat.name return after the last line of code is executed?

```ruby
class Cat
  attr_accessor :name

  def set_name
    name = "Cheetos"
  end
end

cat = Cat.new
cat.set_name
```
`cat.name` will return `nil`, as the `@name` is not initialized.

on line xxx we are just initializing a local variable `name`. As to call a setter we have to be explicit and call it on `self`, or we can just directly reference the `@name` instance variable within the `#set_name`.


#12 — What will the last two lines of code output?

```ruby
module Walk
  STR = "Walking"
end

module Run
  STR = "Running"
end

module Jump
  STR = "Jumping"
end

class Bunny
  include Jump
  include Walk
  include Run
end

class Bugs < Bunny; end

p Bugs.ancestors
p Bugs::STR
```
`[Bugs, Bunny, Run, Walk, Jump, Object, Kernel, BasicObject]`

`"Running"`


#13 — What will be returned by the value1 and value2 method calls?

```ruby

VAL = 'Global'

module Foo
  VAL = 'Local'

  class Bar
    def value1
      VAL
    end
  end
end

class Foo::Bar
  def value2
    VAL
  end
end

p Foo::Bar.new.value1 # "Local"
p Foo::Bar.new.value2 # "Global"

```
This is because Ruby resolves the Constant `VAL` on line xxx by searching in the enclosing structure of class bar then in the module Foo

#15 — What will be output when the last 2 lines of code get executed?

```ruby
class Foo
  @@var = 1

  def self.var
    @@var
  end
end

class Bar < Foo
  @@var = 2
end

puts Foo.var # 2
puts Bar.var # 2
```
Supercalsses and subclasses all share a single copy of the class variable. As class variables is loaded when Ruby evaluates the class so by reassiging the class variable in the bar class has alsoeffected the value of the class variable in the superclass.


#16 — Update the Human class to have lines 11 and 14 return the desired output.

```ruby
# Problem taken from tinyurl.com/mr42tf4t, creator: Raul Romero

class Human 
    attr_reader :name

  def initialize(name="Dylan")
    @name = name
  end

  def hair_color(color)
    "Hi my name is #{name} and I have #{color} hair"
  end

  def self.hair_color(color)
    color = "blonde" if color.empty?
    "Hi my name is #{self.new.name} and I have #{color} hair"
end

puts Human.new("Jo").hair_color("blonde")  
# Should output "Hi, my name is Jo and I have blonde hair."

puts Human.hair_color("")              
# Should "Hi, my name is Dylan and I have blonde hair."
```