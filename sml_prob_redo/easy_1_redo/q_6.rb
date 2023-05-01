class Flight
  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end
# by deleteing unwanted attr_accessor we are hiding away the implementaion details
# Now the users of the objects cannot access or modify `@database_handel easily.
#