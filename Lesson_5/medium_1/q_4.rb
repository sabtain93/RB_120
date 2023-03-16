=begin
queue is an array

keep track of the array positions

info hash = { :oldest => 1, :earliest => 2}

to check if a position is empty we can compare the value with nil
as nil is never passed as a value but represents empty space

=end
# require 'pry'
class CircularQueue

  def initialize(max_size)
    @buffer = [nil] * max_size
    @oldest_pos = 0
    @next_pos = 0
  end

  def enqueue(object)
    if !@buffer[@next_pos].nil?
      @oldest_pos = increment(@next_pos)
    end

    @buffer[@next_pos] = object
    @next_pos = increment(@next_pos)
  end

  def dequeue
    value = @buffer[@oldest_pos]
    @buffer[@oldest_pos] = nil
    @oldest_pos = increment(@oldest_pos) if !value.nil?
    value
  end

  private

  def increment(position)
    (position + 1) % @buffer.size
  end
end



# queue = CircularQueue.new(3)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil