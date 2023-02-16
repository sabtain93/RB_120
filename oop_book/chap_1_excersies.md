### 1. How do we create an object in Ruby? Give an example of the creation of an object.

We create an object by first defining a class then instantiating it by using the `.new` method to create an instance, also known as an object 

For example:
```ruby
class Bikes
end

kawasaki = Bikes.new

```

### 2. What is a module? What is its purpose? How do we use them with our classes? Create a module for the class you created in exercise 1 and include it properly.

A module is a collection of behaviours that is usable in other classes via mixin. A module allows us to put resulable code into one place. We use a module with our class by mixin the module in our class by invoking `include` method followed by the name of the module.




```ruby
module Start
  def start
    puts "bike is onn"
  end
end

class Bike
  include Start
end

kawasaki = Bikes.new
kawasaki.start


```