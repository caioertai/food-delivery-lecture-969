require_relative "repositories/room_repository"
require_relative "repositories/patient_repository"

room_repo = RoomRepository.new("data/rooms.csv")
patient_repo = PatientRepository.new("data/patients.csv", room_repo)

puts "----- Room Repo"
p room_repo

puts "-----------------------------"
puts "----- Patient Repo"
p patient_repo
