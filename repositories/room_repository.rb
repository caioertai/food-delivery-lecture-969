require_relative "../models/room"
require "csv"

class RoomRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @rooms = []
    load_csv
  end

  def add(new_room)
    new_room.id = next_id # AUTO INCREMENT
    @rooms << new_room
    # Write????
  end

  def find(id)
    @rooms.find { |room| room.id == id }
  end

  private

  def next_id # AUTO INCREMENT
    @rooms.empty? ? 1 : @rooms.last.id + 1
  end

  def load_csv
    CSV.foreach(@csv_path, headers: true, header_converters: :symbol) do |row|
      # Type Casting
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i

      @rooms << Room.new(row)
    end
  end
end
