# make the filp switch method and the switch setter method private

# class Machine
#   attr_writer :switch

#   def start
#     self.flip_switch(:on)
#   end

#   def stop
#     self.flip_switch(:off)
#   end

#   def flip_switch(desired_state)
#     self.switch = desired_state
#   end
# end

class Machine

  def info
    "The machine is #{switch}"
  end

  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  private

  def flip_switch(desired_state)
    self.switch = desired_state
  end

  attr_accessor :switch
end

cutting = Machine.new
cutting.start
puts cutting.info
cutting.stop
puts cutting.info
