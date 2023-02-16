# so we have a generic class Animal
# we have a Fish class that subclasses Animal
# then we have a mammal class that subclasses Animal as well
# then we have two classes Cat and Dog that subclass from Mammal class
# so now if we have a behaviour swim now all fish swim but not all mamamls swim
# so we cant have a swim method in the Animal class
# but some Mammals like dogs do swim
# now we cannot add a swom method in the Fish class and in Dog class
# as this violates the DRY rule
# we will group these behaviours into a module and then mix in that module to the classes
# that require these behaviours

module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  inculde Swimmable       # mixing in swimmable module
end

class Mammal < Animal
end

class Dog < Mammal
  include Swimmable      # mixing in Swimmable module
end

class Cat < Mammal
end

# Now Fish and Dog