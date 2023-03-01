class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

class BullDog < Dog
  def swim
    "can't swim!"
  end
end

bully = BullDog.new
puts bully.speak           # => "bark!"
puts bully.swim           # => "swimming!"