require_relative "../models/patient"
require "csv"

class PatientRepository
  def initialize(csv_path, room_repository)
    @room_repository = room_repository

    @csv_path = csv_path
    @patients = []
    load_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_path, headers: true, header_converters: :symbol) do |row|
      # Type Casting
      row[:id]      = row[:id].to_i
      row[:room_id] = row[:room_id].to_i
      row[:insured] = row[:insured] == "true"

      patient = Patient.new(row)

      # Associate patient to their room
      patient_room = @room_repository.find(row[:room_id])
      patient_room.add_patient(patient)

      @patients << patient
    end
  end
end
