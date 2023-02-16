module Speak
  def speak(voice)
    puts voice
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak("arf")

bob = HumanBeing.new
bob.speak("Hello")


=begin
In the bove example both the objects from the GoodDog and HumanBeing class have access to the
speak instance method. This is beacus ewe have mixed in the Speak module in both classes.
=end