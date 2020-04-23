json.array! @patients do |patient|
  json.extract! patient, :id, :nom, :prenom, :age, :tel
end
