class Patient
  attr_accessor :id, :room
  attr_reader :name

  def initialize(attrs = {})
    @id      = attrs[:id]
    @name    = attrs[:name]             # String
    @insured = attrs[:insured] || false # boolean
    @room    = attrs[:room]             # Room # belongs to a room
  end

  def insured?
    @insured
  end

  def got_insured!
    @insured = true
  end
end
