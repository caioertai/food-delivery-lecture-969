class Room
  attr_accessor :id
  attr_reader :patients

  def initialize(attrs = {})
    @id       = attrs[:id]
    @capacity = attrs[:capacity] || 1
    @patients = attrs[:patients] || [] # has many patients
  end

  def add_patient(new_patient)
    raise ArgumentError, "room is at capacity" unless under_capacity?

    @patients << new_patient # Adding the ringo to @patients
    new_patient.room = self  # Assigning itSELF as a room
  end

  def under_capacity?
    @capacity > @patients.count
  end
end
